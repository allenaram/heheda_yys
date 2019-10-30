---------------麒麟界面----------------
麒麟界面={}
setmetatable(麒麟界面, {__index = 选层})

function 麒麟界面.to组队界面()
	for i=1,5 do
		if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2}) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：麒麟面板')
	
	if 参数.使用默认层数 then
		操作.点击按钮(按钮.麒麟界面_组队按钮)
		mSleep(666) 
		return 麒麟界面.Next()
	end
	
	local ocr, msg = createOCR({
		type = "tesseract",
		path = "res/", 
		lang = "chi",
		psm=6
	})
	
	while true do
		if 麒麟界面.选择层数(参数.觉醒层数, '从上到下', ocr) then
			操作.点击按钮(按钮.麒麟界面_组队按钮)
			mSleep(666) 
			ocr:release()
			return 麒麟界面.Next()
		end
		if 麒麟界面.选择层数(参数.觉醒层数, '从下到上', ocr) then
			操作.点击按钮(按钮.麒麟界面_组队按钮)
			mSleep(666) 
			ocr:release()
			return 麒麟界面.Next()
		end
		
		if not(操作.或识别({标识.麒麟界面1,标识.麒麟界面2}))then	
			ocr:release()
			return 执行任务.重新识别()
		end
	end
	
end

function 麒麟界面.to战斗准备界面()
	for i=1,5 do
		if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2}) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：麒麟面板')
	
	执行任务.检查副任务()
	
	if 参数.使用默认层数 then
		操作.点击按钮(按钮.麒麟界面_挑战按钮)
		mSleep(2000)
		return 麒麟界面.Next()
	end
		
	local ocr, msg = createOCR({
		type = "tesseract",
		path = "res/", 
		lang = "chi",
		psm=6
	})
	
	while true do
		if 麒麟界面.选择层数(参数.觉醒层数, '从上到下', ocr) then
			操作.点击按钮(按钮.麒麟界面_挑战按钮)
			mSleep(2000)
			ocr:release()
			return 麒麟界面.Next()
		end
		if 麒麟界面.选择层数(参数.觉醒层数, '从下到上', ocr) then
			操作.点击按钮(按钮.麒麟界面_挑战按钮)
			mSleep(2000)
			ocr:release()
			return 麒麟界面.Next()
		end
		
		if not(操作.或识别({标识.麒麟界面1,标识.麒麟界面2}))then	
			ocr:release()
			return 执行任务.重新识别()
		end
	end
	
end

function 麒麟界面.to探索界面()
	for i=1,5 do
		if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2}) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：麒麟面板')
	
	操作.点击按钮(按钮.麒麟界面_关闭按钮)
	mSleep(666)
	return 麒麟界面.Next()
end
