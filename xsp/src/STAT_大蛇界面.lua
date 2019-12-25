---------------选层函数----------------
选层 = {}
function 选层.层数识别预处理(X, Y)
	-- 图像二值化 --
	local colorTbl = binarizeImage({
		rect = {X,Y,X+32,Y+32},
		diff = {"0x34312e-0x4f4f4f"}
	})
	-- 把无效行（全1行）重置成全0行 --
	for _, row in pairs(colorTbl) do
		local 无效行 = true
		for n = 1, #row do
			if row[n] == 0 then
				无效行 = false
				break
			end
		end
		if 无效行 then
			for n = 1, #row do
				row[n] = 0
			end
		end
	end
	
	local 全零行数=0
	for _, row in pairs(colorTbl) do
		local 全零行 = true
		for n = 1, #row do
			if row[n] == 1 then
				全零行 = false
				break
			end
		end
		if 全零行 then
			全零行数 = 全零行数 + 1
		end
	end
	--  sysLog(string.format('全零行数：%d，总行数：%d',全零行数,#colorTbl))
	--	for _, row in pairs(colorTbl) do
	--		sysLog(table.concat(row, ','))
	--	end
	local 字符有效 = 全零行数 > (#colorTbl*3/4) and false or true
	return 字符有效, colorTbl
end

function 选层.选择层数(目标层数, 寻找方向, ocr)
	local isEleven = false
	if 目标层数 == '悲鸣' then
		isEleven = true
		目标层数 = '拾'
	end
	local x1,y1,x2,y2
	if 寻找方向=='从上到下' then	
		x1,y1,x2,y2 = 330, 200, 330, 350
	elseif 寻找方向=='从下到上' then
		x1,y1,x2,y2 = 330, 350, 330, 200
	end	
	
	local found = false
	local 层数按钮 = {x=-1, y=-1}
	for i = 1, 3 do
		local X = 250
		keepScreen(true)
		for Y = 528, 132, -5 do
			local 字符有效, colorTbl = 选层.层数识别预处理(X, Y)
			local code, text
			if 字符有效 then
				code, text = ocr:getText({
					data = colorTbl,
					whitelist = "壹贰叁肆伍陆柒捌玖拾" 
				})
			end
			if trim(text) == 目标层数 
				and not (isEleven and Y>=413) then --悲鸣
				层数按钮 = isEleven and {x=X, y=Y+93} or {x=X, y=Y+15}
				操作.点击(层数按钮)
				found = true
				mSleep(500)
				break
			end
		end
		keepScreen(false)
		if found then
			break
		end
		
		操作.滑动(x1,y1,x2,y2,200)
		mSleep(600)
	end
	return found
end

---------------大蛇界面----------------
大蛇界面={}
setmetatable(大蛇界面, {__index = 选层})

function 大蛇界面.to组队界面()
	for i=1,5 do
		if 操作.识别2(标识.大蛇界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：大蛇面板')
	
	if 参数.使用默认层数 then
		操作.点击按钮(按钮.大蛇界面_组队按钮)
		mSleep(666) 
		return 大蛇界面.Next()
	end
	
	local ocr, msg = createOCR({
		type = "tesseract",
		path = "res/", 
		lang = "chi",
		psm=6
	})
	
	while true do
		if 大蛇界面.选择层数(参数.御魂层数, '从上到下', ocr) then
			操作.点击按钮(按钮.大蛇界面_组队按钮)
			mSleep(666) 
			ocr:release()
			return 大蛇界面.Next()
		end
		if 大蛇界面.选择层数(参数.御魂层数, '从下到上', ocr) then
			操作.点击按钮(按钮.大蛇界面_组队按钮)
			mSleep(666) 
			ocr:release()
			return 大蛇界面.Next()
		end
		
		if not 操作.识别2(标识.大蛇界面) then	
			ocr:release()
			return 执行任务.重新识别()
		end
	end
	
end

function 大蛇界面.to战斗准备界面()
	for i=1,5 do
		if 操作.识别2(标识.大蛇界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：大蛇面板')
	
	执行任务.检查副任务()
	
	if 参数.使用默认层数 then
		操作.点击按钮(按钮.大蛇界面_挑战按钮)
		mSleep(2000)
		return 大蛇界面.Next()
	end
	
	local ocr, msg = createOCR({
		type = "tesseract",
		path = "res/", 
		lang = "chi",
		psm=6
	})
	
	while true do
		if 大蛇界面.选择层数(参数.御魂层数, '从上到下', ocr) then
			操作.点击按钮(按钮.大蛇界面_挑战按钮)
			mSleep(2000)
			ocr:release()
			return 大蛇界面.Next()
		end
		if 大蛇界面.选择层数(参数.御魂层数, '从下到上', ocr) then
			操作.点击按钮(按钮.大蛇界面_挑战按钮)
			mSleep(2000)
			ocr:release()
			return 大蛇界面.Next()
		end
		
		if not(操作.识别2(标识.大蛇界面))then	
			ocr:release()
			return 执行任务.重新识别()
		end
	end
	
end

function 大蛇界面.to探索界面()
	for i=1,5 do
		if 操作.识别2(标识.大蛇界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：大蛇面板')
	
	操作.点击按钮(按钮.大蛇界面_关闭按钮)
	mSleep(666)
	return 大蛇界面.Next()
end