---------------轮回秘境---------------
轮回秘境界面={}

function 轮回秘境界面.to轮回秘境准备界面()
	for i=1,15 do
		if 操作.识别(标识.轮回秘境界面) then
			break
		elseif i==15 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：轮回秘境')
	mSleep(1500) --等待格子刷出来
	
	--[[
	local ocr, msg = createOCR({type = "tesseract", })	
	local colorTbl = binarizeImage({
		rect = {819,21,880,38},
		diff = {"0xb7ac9a-0x4f4f4f"}
	})
	local code, text = ocr:getText({
		data=colorTbl,
		whitelist = "0123456789/" 
	})
	ocr:release()
	if trim(text)=='0/50' then
		if 参数.提示信息 then
			syslog2("溯玉已耗尽！");
		end
		for var = 1,2 do
			vibrator()
			mSleep(1000)
		end
		lua_exit()
	end
	--]]
	
	--领奖
	keepScreen(true)
	if 操作.识别点击(按钮.轮回秘境界面_时曲碎片) then
		mSleep(1000)
		keepScreen(false)
		return 轮回秘境界面.to轮回秘境准备界面() 
	end
	if 操作.识别点击(按钮.轮回秘境界面_轮回之眼) then
		mSleep(1000)
		keepScreen(false)
		return 轮回秘境界面.to轮回秘境准备界面()
	end
	if 操作.识别点击(按钮.轮回秘境界面_宝箱) then
		mSleep(666)
		keepScreen(false)
		return 战斗结算界面1.to战斗结算界面2()
	end
	
	--进下一层
	if 参数.轮回秘境_推图策略=='平推' then
		--do nothing
	elseif 操作.识别点击(按钮.轮回秘境界面_下一层) then
		keepScreen(false)
		mSleep(666)
		if 操作.识别2(标识.轮回秘境准备界面) then
			return 轮回秘境界面.Next()
		elseif 操作.识别2(标识.轮回秘境下一层确认界面) then
			return 轮回秘境下一层确认界面.to轮回秘境选择资源界面()
		else
			return 执行任务.重新识别()
		end
	end
	
	--识别
	local map = {}
	local tStatus = 
	{
		["BACK"] = 0,
		["BACK_REACH"] = 0,
		["SIMPLE"] = 1,
		["SIMPLE_REACH"] = 1,
		["TREASURE"] = 2,
		["TREASURE_REACH"] = 2,
		["CHIP"] = 3,
		["CHIP_REACH"] = 3,
		["EYE"] = 4,
		["EYE_REACH"] = 4,
		["NONE"] = 5,
		["DOOR"] = 6,
		["DOOR_REACH"] = 6,
	}
	local numNONE = {0,0,0,0}
	local eyeUsed = false
	for i = 1,4 do
		map[i] = {}
		for j = 1,8 do
			map[i][j] = tStatus.NONE
			local tPattern = 
			{
				["CHIP"] = {0xa5a49f,"-13|12|0xa4a190,3|-17|0xa5a49e,-35|21|0x5b717f,-47|22|0x495368,-71|4|0x3e475c,4|1|0xa4a296,-4|-2|0xa5a4a2", 93, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["CHIP_REACH"] = {0xaba9a6,"-4|0|0xabaaa8,1|6|0xaaa89e,-15|14|0xaaa799,2|-13|0xaaaaa6,-48|26|0x545f73,-71|9|0x4a5365,-26|-46|0x4a5468", 93, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["BACK"] = {0x32444d,"-10|0|0x32444d,-9|15|0x31434b,-23|16|0x475859,3|25|0x4b565e,13|0|0x4d5860,21|-4|0x34454f,-33|-3|0x2f4149,3|34|0x30424a", 92, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["BACK_REACH"] = {0x626d70,"12|-9|0x626d71,-13|0|0x626e71,-15|-36|0x626e72,-26|-27|0x626d71,-32|-31|0x4b5a63,-4|-18|0x8f928b,-8|-15|0x96988f,-8|-22|0x9a9c92,9|7|0x4a5961", 93, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["SIMPLE"] = {0x372a1e,"-16|9|0x88867f,12|11|0x8b8980,-21|33|0x695012,13|39|0x9a902d,-36|47|0x801a1d", 93, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["SIMPLE_REACH"] = {0x9e9c94,"25|-3|0x999791,11|-14|0x54483e,-28|37|0x8b833e,-17|31|0x893334,39|9|0x50463c", 90, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["TREASURE"] = {0x742c18,"-28|-3|0x6f2218,3|-23|0x332025,-21|-20|0x7a3619,10|31|0x866017", 95, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["TREASURE_REACH"] = {0x813f33,"33|7|0x844334,29|-19|0x4d3c3d,8|-18|0x894e36,39|35|0x977231", 93, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["EYE"] = {0x6f643a,"0|-7|0x918f77,-7|-9|0x6c6138,1|-17|0x695d37,-1|-25|0x8a856f,1|28|0x87836c", 95, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["EYE_REACH"] = {0x877d5a,"-7|-6|0x847b59,9|10|0x847959,-9|-22|0x9d9986,19|24|0x9b9683,1|-17|0x807758,1|20|0x7f7557",93, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["DOOR"] = {0x381006,"-2|33|0xf9f8f8,-30|-12|0x3c4b5a,28|-12|0x3e4c5c,-15|-2|0xc64026", 90, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
				["DOOR_REACH"] = {0x5c3b33,"-1|32|0xf9f9f9,-15|-1|0xc05a49,15|-1|0xbe5948,21|13|0xde755c,-22|13|0xde755c", 90, 158+116*(j-1), 155+116*(i-1), 270+116*(j-1), 240+116*(i-1)},
			}
			
			for status, pattern in pairs(tPattern) do
				if 操作.识别2(pattern) then
					map[i][j] = tStatus[status]
					if status == "BACK" or status == "BACK_REACH" then
						--时曲碎片特别容易被识别成牌背，取色非常困难，所以需要二次确认，只能牺牲效率
					else
						eyeUsed = true
						break
					end
				end
			end
			
			if map[i][j] == tStatus.NONE then
				numNONE[i] = numNONE[i] + 1
			end
		end
	end
	keepScreen(false)
	if 参数.轮回秘境_推图策略=='平推' and numNONE[1]+numNONE[2]+numNONE[3]+numNONE[4]==31 and 操作.识别点击(按钮.轮回秘境界面_下一层) then
		mSleep(666)
		if 操作.识别2(标识.轮回秘境准备界面) then
			return 轮回秘境界面.Next()
		elseif 操作.识别2(标识.轮回秘境下一层确认界面) then
			return 轮回秘境下一层确认界面.to轮回秘境选择资源界面()
		else
			return 执行任务.重新识别()
		end
	end
	
	--选择
	if not eyeUsed then --未使用轮回之眼，按挖掘逻辑
		local tarLine = 1
		local allNONE = 0
		local hasEye = true
		if 参数.轮回秘境_使用眼 then
			local ocr, msg = createOCR({type = "tesseract", })	
			local colorTbl = binarizeImage({
				rect = {1016,19,1063,39},
				diff = {"0xe3dcc9-0x4f4f4f"}
			})
			local code, text = ocr:getText({
				data=colorTbl,
				whitelist = "0123456789" 
			})
			ocr:release()
			if trim(text)=='0' then
				hasEye = false
			end
		end
		
		for i = 1,4 do
			if numNONE[i] ~= 8 or 参数.轮回秘境_使用眼 and hasEye then
				tarLine = (numNONE[tarLine] < numNONE[i] or i == 2 and numNONE[tarLine] == numNONE[i]) and i or tarLine --第一、二行数量相同，选择第二行；第三、四行相同，选择第三行
			end
			allNONE = allNONE + numNONE[i]
		end
		if numNONE[tarLine] == 8 then
			--使用用轮回之眼
			操作.识别点击(按钮.轮回秘境界面_消耗眼, false)
			mSleep(3000)
			return 轮回秘境界面.to轮回秘境准备界面()
		end
		
		local tarCol
		if allNONE == 1 then --新的一层
			tarCol = map[tarLine][1] == tStatus.NONE and 1 or 8
			tarLine = tarLine == 1 and 2 or 3
		elseif map[tarLine][1] == tStatus.NONE then --从左边开始点
			for i = 2,8 do
				if map[tarLine][i] ~= tStatus.NONE then
					tarCol = i
					break
				end
			end
		else --从右边开始点
			for i = 7,1,-1 do
				if map[tarLine][i] ~= tStatus.NONE then
					tarCol = i
					break
				end
			end		
		end
		
		local targetBtn = {x1 = 189+116*(tarCol-1), y1 = 156+116*(tarLine-1), x2 = 243+116*(tarCol-1), y2 = 215+116*(tarLine-1)}
		操作.点击按钮(targetBtn)
		mSleep(300)
		return 轮回秘境界面.Next()

	else --已使用轮回之眼，按优先级逻辑
		keepScreen(true)
		for _, tPattern in ipairs(参数.轮回秘境_优先级) do
			local tarLine, tarCol = 轮回秘境界面.findPatternAvailable(tPattern, map, tStatus)
			if tarLine then
				local targetBtn = {x1 = 189+116*(tarCol-1), y1 = 156+116*(tarLine-1), x2 = 243+116*(tarCol-1), y2 = 215+116*(tarLine-1)}
				操作.点击按钮(targetBtn)
				mSleep(300)
				keepScreen(false)
				return 轮回秘境界面.Next()
			end
		end
		keepScreen(false)
	end
	
end

function 轮回秘境界面.findPatternAvailable(tPattern, map, tStatus)
	for _, pattern in pairs(tPattern) do
		local tmp = 操作.全识别(pattern)
		for _, item in pairs(tmp) do
			local col = math.ceil((item.x-160)/116)
			local row = math.ceil((item.y-127)/116)
			if col>0 and col<9 and row>0 and row<5 then 
				if row>1 and map[row-1][col] == tStatus.NONE or
				   row<4 and map[row+1][col] == tStatus.NONE or
				   col>1 and map[row][col-1] == tStatus.NONE or
				   col<8 and map[row][col+1] == tStatus.NONE then
				   return row,col
				end
			end
		end
	end
	return nil
end

---------轮回秘境下一层确认界面----------
轮回秘境下一层确认界面={}
function 轮回秘境下一层确认界面.to轮回秘境选择资源界面()
	for i=1,15 do
		if 操作.识别(标识.轮回秘境下一层确认界面) then
			break
		elseif i==15 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('确认进入下一层')

	操作.点击按钮(按钮.轮回秘境下一层确认界面_确认)
	mSleep(4500)
	return 轮回秘境下一层确认界面.Next()
end


---------轮回秘境选择资源界面----------
轮回秘境选择资源界面={}
function 轮回秘境选择资源界面.to轮回秘境界面()
	for i=1,15 do
		if 操作.识别(标识.轮回秘境选择资源界面) then
			break
		elseif i==15 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('选择资源')
	
	local tUpBtn = 
	{
		["金币"] = 按钮.轮回秘境选择资源界面_金币,
		["经验"] = 按钮.轮回秘境选择资源界面_经验,
		["御魂"] = 按钮.轮回秘境选择资源界面_御魂,
		["觉醒"] = 按钮.轮回秘境选择资源界面_觉醒,
	}

	操作.点击按钮(tUpBtn[参数.轮回秘境_掉落选择])
	mSleep(666)
	操作.识别点击(按钮.轮回秘境选择资源确认界面_确认)
	mSleep(3000)
	return 轮回秘境选择资源界面.Next()
end

