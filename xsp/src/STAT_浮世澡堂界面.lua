----------浮世澡堂界面------------
浮世澡堂界面={泡澡,}

function 浮世澡堂界面.泡澡()
	for i=1,15 do
		if 操作.识别2(标识.浮世澡堂界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:浮世澡堂')
	
	if 参数.离岛泡澡次数用尽 or not(参数.离岛免费泡澡) then
		操作.点击按钮(按钮.浮世澡堂界面_关闭)
		mSleep(888)
		return 离岛界面.to道场（居酒屋）界面()
	end
	
	--识别剩余次数
	local ocr, msg = createOCR({
    type = "tesseract", 
	})
	local colorTbl = binarizeImage({
		rect = {994,487,1004,503},
		diff = {"0xdbd5c3-0x3f3f3f"}
	})
	local code, text = ocr:getText({
		data=colorTbl,
		whitelist = "0123456789" 
	})
	ocr:release()
	if trim(text) == '0' then
		参数.离岛泡澡次数用尽 = true
		if 参数.离岛消耗勾玉 then
			参数.离岛CD冷却时刻 = -1
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(888)
			return 离岛界面.to浮世澡堂界面()
		end
		if 参数.任务=='离岛之歌' then --主任务次数用尽
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			if 参数.交叉寮突破 then
				for i=1,2 do
					sysLog('泡澡次数已用尽')
					mSleep(1000)
					sysLog('即将切换寮突破为主任务')
					mSleep(1000)
				end
				执行任务.切换寮突破为主任务()
			elseif 参数.交叉犬夜叉 then
				for i=1,2 do
					sysLog('泡澡次数已用尽')
					mSleep(1000)
					sysLog('即将切换寮犬夜叉为主任务')
					mSleep(1000)
				end
				执行任务.切换犬夜叉为主任务()
			else
				syslog2("泡澡次数已用尽！")
				for var = 1,2 do
					vibrator()
					mSleep(1000)
				end
				lua_exit()
			end
		else --副任务次数用尽
			if 参数.提示信息 then
				syslog2("泡澡次数已用尽，不再前往离岛！")
			end
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(666)
			参数.主任务=true
			参数.交叉离岛=false
			执行任务.设置流程()
			if 参数.智能开关buff then
				参数.调整开关buff='开'
			end
			if 参数.提示信息 then
				syslog2('切换主任务')
			end
			return 执行任务.主任务()
		end
	end
	
	--识别CD
	local ocr, msg = createOCR({
    type = "tesseract", 
	})
	local colorTbl = binarizeImage({
		rect = {947,560,968,577},
		diff = {"0xe5e0cd-0x3f3f3f"}
	})
	local code, text = ocr:getText({
		data=colorTbl,
		whitelist = "0123456789" 
	})
	ocr:release()
	if trim(text) ~= '' and trim(text)~='00' then
		local ocr, msg = createOCR({
		type = "tesseract", 
		})
		local code, text
		while true do
			local colorTbl = binarizeImage({
				rect = {1055,17,1093,37},
				diff = {"0xdfd7c5-0x3f3f3f"}
			})
			code, text = ocr:getText({
				data=colorTbl,
				whitelist = "0123456789" 
			})
			if trim(text)=='' then
				toast('无法识别活力值，请隐藏悬浮窗等遮挡物！')
			else
				break
			end
			mSleep(2000)
		end
		ocr:release()
		
		if tonumber(trim(text)) == nil then
			toast('无法识别活力值，请隐藏悬浮窗等遮挡物！')
			mSleep(3000)
			return 浮世澡堂界面.泡澡()
		end
		
		if 参数.离岛副本~='御魂' and tonumber(trim(text))>=12 or
		   参数.离岛副本=='御魂' and tonumber(trim(text))>=10 then
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(888)
			return 离岛界面.to道场（居酒屋）界面()
		end
	
		参数.离岛CD冷却时刻 = mTime() + (tonumber(trim(text))+1)*60000
		
		if 参数.离岛消耗勾玉 then
			操作.点击按钮(按钮.浮世澡堂界面_关闭)
			mSleep(888)
			return 离岛界面.to道场（居酒屋）界面()
		end
			
		if 参数.任务=='离岛之歌' then --主任务离岛CD中
			while mTime()<参数.离岛CD冷却时刻 do
				sysLog('离岛CD...')
				if 参数.交叉犬夜叉 and 参数.主任务 and (mTime()-参数.犬夜叉开始计时时刻)>1800000 then
					参数.寮突破CD重新计时=false
					return 执行任务.切换犬夜叉()
				end
				
				if 参数.交叉年兽 and 参数.主任务 and (mTime()-参数.年兽开始计时时刻)>43200000 then
					参数.年兽CD重新计时=false
					return 执行任务.切换年兽()
				end
				
				if 参数.交叉寮突破 and 参数.主任务 and (mTime()-参数.寮突破开始计时时刻)>参数.寮突破间隔 then
					参数.寮突破CD重新计时=true
					return 执行任务.重新识别()
				end
				mSleep(3000)
			end
			return 执行任务.重新识别()
		else --副任务离岛CD中
			参数.主任务=true
			执行任务.设置流程()
			if 参数.智能开关buff then
				参数.调整开关buff='开'
			end
			if 参数.提示信息 then
				syslog2('离岛CD中!切换主任务')
			end
			return 执行任务.主任务()
		end
	end
	
	if 参数.离岛汤浴=='粗盐' then
		操作.点击按钮(按钮.浮世澡堂界面_粗盐)
	elseif 参数.离岛汤浴=='薰草' then
		操作.点击按钮(按钮.浮世澡堂界面_薰草)
	else
		操作.点击按钮(按钮.浮世澡堂界面_露天)
	end
	mSleep(777)
	
	操作.点击按钮(按钮.浮世澡堂界面_泡浴)
	mSleep(3000)
	操作.点击按钮(按钮.浮世澡堂界面_泡浴确认)
	mSleep(888)
	操作.点击按钮(按钮.浮世澡堂界面_关闭)
	mSleep(888)
	return 离岛界面.to道场（居酒屋）界面()
	
end

function 浮世澡堂界面.to离岛界面()
	for i=1,15 do
		if 操作.识别2(标识.浮世澡堂界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:浮世澡堂')
	
	操作.点击按钮(按钮.浮世澡堂界面_关闭)
	mSleep(666)
	return 执行任务.重新识别()
end