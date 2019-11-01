---------------神兽界面----------------
神兽界面={}
setmetatable(神兽界面, {__index = 选层})

function 神兽界面.to战斗准备界面()
	for i=1,5 do
		if 操作.识别2(标识.神兽界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：神兽面板')
	
	执行任务.检查副任务()
	
	--识别御灵券
	local text = 操作.字符识别({819,14,902,37}, {"0xddd5c3-0x4f4f4f"})
	if text == '0' then
		操作.点击按钮(按钮.神兽界面_关闭按钮)
		if 参数.交叉寮突破 then
			for i=1,2 do
				sysLog('御灵券已用尽')
				mSleep(1000)
				sysLog('即将切换寮突破为主任务')
				mSleep(1000)
			end
			执行任务.切换寮突破为主任务()
		elseif 参数.交叉犬夜叉 then
			for i=1,2 do
				sysLog('个人突破券已用尽')
				mSleep(1000)
				sysLog('即将切换寮犬夜叉为主任务')
				mSleep(1000)
			end
			执行任务.切换犬夜叉为主任务()
		else
			if 参数.提示信息 then
				syslog2("没有御灵券了！");
			end
			for var = 1,2 do
				vibrator()
				mSleep(1000)
			end
			lua_exit()
		end
	end
	
	local ocr, msg = createOCR({
		type = "tesseract",
		path = "res/", 
		lang = "chi",
		psm=6
	})
	
	while true do
		if 神兽界面.选择层数(参数.御灵层数, '从上到下', ocr) then
			操作.点击按钮(按钮.神兽界面_挑战按钮)
			mSleep(2000)
			ocr:release()
			return 神兽界面.Next()
		end
		if 神兽界面.选择层数(参数.御灵层数, '从下到上', ocr) then
			操作.点击按钮(按钮.神兽界面_挑战按钮)
			mSleep(2000)
			ocr:release()
			return 神兽界面.Next()
		end
		
		if not 操作.识别2(标识.神兽界面) then	
			ocr:release()
			return 执行任务.重新识别()
		end
	end
	
end

function 神兽界面.to探索界面()
	for i=1,5 do
		if 操作.识别2(标识.神兽界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：神兽面板')
	
	操作.点击按钮(按钮.神兽界面_关闭按钮)
	mSleep(666)
	return 神兽界面.Next()
end
