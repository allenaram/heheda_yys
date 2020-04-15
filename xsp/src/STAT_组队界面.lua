---------------组队界面---------------
组队界面={to创建队伍界面,to大蛇界面,to麒麟界面,to房间界面,to庭院界面}

function 组队界面.to创建队伍界面()
	keepScreen(false)
	for i=1,5 do
		if 操作.识别2(标识.组队界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：组队面板')

	操作.点击按钮(按钮.组队界面_创建队伍按钮)
	mSleep(666) 
	return 组队界面.Next()

end

function 组队界面.to大蛇界面()
	组队界面.后退()
end

function 组队界面.to麒麟界面()
	组队界面.后退()
end

function 组队界面.to卑弥呼界面()
	组队界面.后退()
end

function 组队界面.to庭院界面()
	组队界面.后退()
end

function 组队界面.to探索界面()
	组队界面.后退()
end

function 组队界面.后退()
	for i=1,5 do
		if 操作.识别2(标识.组队界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：组队面板')
	
	操作.点击按钮(按钮.组队界面_关闭按钮)
	mSleep(666)
	return 组队界面.Next()
end

function 组队界面.to房间界面()	--妖气封印
	for i=1,5 do
		if 操作.识别2(标识.组队界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：组队面板')
	
	if (参数.交叉死神 and 参数.主任务 and (mTime()-参数.死神开始计时时刻)>1800000) or
	   (参数.交叉年兽 and 参数.主任务 and (mTime()-参数.年兽开始计时时刻)>43200000) or
	   (参数.交叉离岛 and 参数.主任务 and mTime()>=参数.离岛CD冷却时刻) then
		return 组队界面.to庭院界面()
	end
	-- 寻找妖气封印 --
	local ocr, msg = createOCR({
		type = "tesseract",
		path = "res/", 
		lang = "yqfy",
		psm=8
	})
	while true do
		if 组队界面.选择副本('从下到上', ocr) then
			ocr:release()
			break
		end
		if 组队界面.选择副本('从上到下', ocr) then
			ocr:release()
			break
		end
		if not 操作.识别2(标识.组队界面)then	
			ocr:release()
			return 执行任务.重新识别()
		end
	end
	-- 寻找妖气副本 --
	if 参数.妖气挤房模式=='旧版挤房' then
		local ocr, msg = createOCR(
		{
			type = "tesseract",
			path = "res/", 
			lang = "yq",
			psm=8
		})
		-- 寻找目标妖气副本 --
		local function searchTargetDungeon()
			local tDungeon = 
			{
				{487,176,511,200},
				{486,266,511,290},
				{485,354,513,380},
				{484,445,513,472},
			}
			local tEnterPattern= 
			{
				标识.组队界面_加入按钮1,
				标识.组队界面_加入按钮2,
				标识.组队界面_加入按钮3,
				标识.组队界面_加入按钮4,
			}
			local tar = 0
			for dungeon, rect in ipairs(tDungeon) do
				if not 操作.识别2(tEnterPattern[dungeon]) then
					break
				end
				local abbr = 操作.字符识别(rect, {"0x494640-0x3f3f3f"}, 
							{"椒鬼二日小海跳骨饿"}, nil, ocr)
				abbr = abbr ~= '' and abbr or '二' -- 二口女难以识别，无奈加此后处理 
				--sysLog(abbr)
				if 参数.妖气目标[abbr] then
					tar = dungeon
					break
				end
			end
			return tar
		end
		
		math.randomseed(tostring(os.time()):reverse():sub(1, 7))
		while true do
			-- 识别刷新加载 --
			while true do
				if not 操作.识别2(标识.组队界面_刷新中) then
					break
				end
				mSleep(100*参数.延时倍数)
			end
			-- 识别副本 -- 
			keepScreen(true)
			local dungeon = searchTargetDungeon()
			keepScreen(false)
			local tEnterBtn = 
			{
				按钮.组队界面_加入按钮1,
				按钮.组队界面_加入按钮2,
				按钮.组队界面_加入按钮3,
				按钮.组队界面_加入按钮4,
			}
			if dungeon == 0 then
			-- 无目标副本 -- 
				mSleep(math.random(300,600))
				操作.点击按钮(按钮.组队界面_刷新按钮)
				mSleep(math.random(200,400))
			else
			-- 找到目标副本 --
				操作.点击按钮(tEnterBtn[dungeon])
				mSleep(300)
				for i=1,10 do 
					if 操作.识别2(标识.组队界面_加入失败) then
						mSleep(1000)
						break
					elseif i==10 or not 操作.识别2(标识.组队界面) then
						ocr:release()
						return 组队界面.Next()
					end
					mSleep(300*参数.延时倍数)
				end
			end
			
			if not(操作.识别2(标识.组队界面)) then
				ocr:release()
				return 执行任务.重新识别()
			end
		end
		
	elseif 参数.妖气挤房模式=='新版挤房' then
		while true do
			for i=1,3 do
				操作.点击按钮(按钮.组队界面_刷新按钮)
				mSleep(20)
				操作.点击按钮(按钮.组队界面_加入按钮1)
				mSleep(20)
			end
			if not 操作.识别2(标识.组队界面) then
				return 组队界面.Next()
			end
		end
		
	elseif 参数.妖气挤房模式=='排队' then
		操作.点击按钮(按钮.组队界面_匹配按钮)
		mSleep(666)
		return 组队界面.Next()
	end	
	
end

function 组队界面.to房间界面2()	--年兽、石距、死神等
	for i=1,5 do
		if 操作.识别2(标识.组队界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：组队面板')
	
	操作.滑动(264, 252, 240, 602)
	mSleep(1000)
	
	if 参数.当前副任务=='死神' then
		if 操作.或识别({标识.组队界面_死神CD1,标识.组队界面_死神CD2}) then --or not((mTime()-参数.死神开始计时时刻)>1800000) then
			sysLog('死神CD中...')
			if 参数.任务=='死神' then
				if 参数.死神CD重新计时 then
					参数.死神开始计时时刻=mTime()
				end
				while true do
					if (mTime()-参数.死神开始计时时刻)>1800000 then
						参数.死神CD重新计时=true
						return 执行任务.重新识别()
					end
					
					if 参数.交叉寮突破 and not(参数.寮突已攻破) and 参数.主任务 and (mTime()-参数.寮突破开始计时时刻)>参数.寮突破间隔 then
						参数.死神CD重新计时=false
						return 执行任务.切换寮突破()
					end
					
					if 参数.交叉个人突破 and 参数.主任务 and 参数.个人突破穿插依据=='CD冷却后切换' and (mTime()-参数.个人突破开始计时时刻)>参数.个人突破间隔 then
						参数.死神CD重新计时=false
						return 执行任务.切换个人突破()
					end
					
					mSleep(3000)
				end
			elseif 参数.交叉死神 then
				操作.点击按钮(按钮.组队界面_关闭按钮)
				mSleep(1000)
				if not(操作.或识别({标识.庭院界面1,标识.庭院界面2})) then
					return 执行任务.重新识别()
				end
				
				参数.死神开始计时时刻=mTime()
				
				if 参数.死神挤车开金币buff then
					参数.调整开关buff='关'
					参数.开关buff表.觉醒=false
					参数.开关buff表.御魂=false
					参数.开关buff表.金币=true
					参数.开关buff表.经验=false
					庭院界面.开关buff()
					参数.开关buff表.觉醒=参数.开关buff表_temp.觉醒
					参数.开关buff表.御魂=参数.开关buff表_temp.御魂
					参数.开关buff表.金币=参数.开关buff表_temp.金币
					参数.开关buff表.经验=参数.开关buff表_temp.经验
				end
				
				if 参数.开关buff表.觉醒 or 参数.开关buff表.御魂 or 参数.开关buff表.金币 or 参数.开关buff表.经验 then
					参数.智能开关buff=true
					参数.调整开关buff='开'
				end
				参数.主任务=true
				执行任务.设置流程()
				if 参数.提示信息 then
					syslog2('切换主任务')
				end
				return 执行任务.主任务()
			end
		end
		
		操作.点击按钮(按钮.组队界面_死神按钮)
		mSleep(666)
		操作.点击按钮(按钮.组队界面_匹配按钮)
		mSleep(666)
		
		while true do
			if not(操作.识别2(标识.组队界面_死神匹配中)) then
				break
			end
			sysLog('排队中...')
			mSleep(2000)
		end
	end
	
	if 参数.当前副任务=='年兽' then
		mSleep(666)
		操作.滑动(266,466,260,205)
		mSleep(1500)
		
		if 操作.或识别({标识.组队界面_年兽CD1,标识.组队界面_年兽CD2}) then --or not((mTime()-参数.年兽开始计时时刻)>43200000) then
			sysLog('年兽CD中...')
			操作.点击按钮(按钮.组队界面_关闭按钮)
			mSleep(1000)
			if not(操作.或识别({标识.庭院界面1,标识.庭院界面2})) then
				return 执行任务.重新识别()
			end
			
			参数.年兽开始计时时刻=mTime()
			
			if 参数.年兽挤车开金币buff then
				参数.调整开关buff='关'
				参数.开关buff表.觉醒=false
				参数.开关buff表.御魂=false
				参数.开关buff表.金币=true
				参数.开关buff表.经验=false
				庭院界面.开关buff()
				参数.开关buff表.觉醒=参数.开关buff表_temp.觉醒
				参数.开关buff表.御魂=参数.开关buff表_temp.御魂
				参数.开关buff表.金币=参数.开关buff表_temp.金币
				参数.开关buff表.经验=参数.开关buff表_temp.经验
			end
			
			if 参数.开关buff表.觉醒 or 参数.开关buff表.御魂 or 参数.开关buff表.金币 or 参数.开关buff表.经验 then
				参数.智能开关buff=true
				参数.调整开关buff='开'
			end
			参数.主任务=true
			执行任务.设置流程()
			if 参数.提示信息 then
				syslog2('切换主任务')
			end
			return 执行任务.主任务()
		end
		
		操作.点击按钮(按钮.组队界面_年兽按钮)
		mSleep(666)
		操作.点击按钮(按钮.组队界面_匹配按钮)
		mSleep(666)
		
		while true do
			if not(操作.识别2(标识.组队界面_匹配中)) then
				break
			end
			sysLog('排队中...')
			mSleep(2000)
		end
	end
	
	return 组队界面.Next()
	
end

function 组队界面.副本识别预处理(Y)
	-- 图像二值化 --
	local colorTbl = binarizeImage({
		rect = {163,Y,250,Y+32},
		diff = {"0x35312c-0x4f4f4f"}
	})
	-- 图像后处理 --
	for _, row in pairs(colorTbl) do
		local 无效行=true
		for n=1,#row do
			if row[n]==0 then
				无效行=false
				break
			end
		end
		if 无效行 then
			for n=1,#row do
				row[n]=0
			end
		end
	end
	
	local 全零行数=0
	for _, row in pairs(colorTbl) do
		local 全零行=true
		for n=1,#row do
			if row[n]==1 then
				全零行=false
				break
			end
		end
		if 全零行 then
			全零行数=全零行数+1
		end
	end
	local 字符有效=true
	--sysLog(string.format('全零行数：%d，总行数：%d',全零行数,#colorTbl))
	if 全零行数>(#colorTbl*3/4) then
		字符有效=false
	end

	return 字符有效,colorTbl
end

function 组队界面.选择副本(寻找方向, ocr)
	if 寻找方向=='从上到下' then	
		x1=262 y1=122 x2=296 y2=316
	elseif 寻找方向=='从下到上' then
		x1=286 y1=540 x2=292 y2=367
	end	
	
	for i=1,2 do
		local X=163
		keepScreen(true)
		for Y=96,565,5/640*参数.设备高 do
			local 字符有效,colorTbl = 组队界面.副本识别预处理(Y)
			
			if 字符有效 then
				code, text = ocr:getText({
					data=colorTbl,
					whitelist = "妖气封"
				})
			end
			
			if trim(text)=='妖气封' and 
				not 操作.识别2({0x272420,"0|1|0x2e2a26", 95, 280, Y, 286, Y+32}) then 
				--for _, row in pairs(colorTbl) do
				--	sysLog(table.concat(row, ','))
				--end
				副本按钮={x=X,y=Y+15}
				keepScreen(false)
				text=nil
				操作.点击(副本按钮)
				--点完妖气按钮后的延时
				mSleep(888)
				while true do
					if not(操作.识别2(标识.组队界面_刷新中)) then
						break
					end 
					mSleep(666)
				end
				if 参数.妖气挤房模式~='旧版挤房' then
					if 参数.妖气目标['海'] or 参数.妖气目标['鬼']
						or 参数.妖气目标['小'] or 参数.妖气目标['日'] then
						操作.滑动(471,369,464,175)
					else
						操作.滑动(464,175,471,369)
					end
				else
					操作.滑动(464,175,471,369)
				end
				mSleep(888)
				操作.点击按钮(参数.妖气目标按钮)
				mSleep(888)
				操作.点击按钮(按钮.组队界面_选择完毕按钮)
				mSleep(500)
				return true
			end
		end
		keepScreen(false)
		操作.滑动(x1,y1,x2,y2,200)
		mSleep(600)
	end
	return false
end

