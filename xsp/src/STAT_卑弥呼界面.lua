---------------卑弥呼界面----------------
卑弥呼界面={}

function 卑弥呼界面.to组队界面()
	for i=1,5 do
		if 操作.识别2(标识.卑弥呼界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：卑弥呼面板')
	
	if not 参数.使用默认层数 then
		local tBtn = 
		{
			["壹"] = 按钮.卑弥呼界面_一层,
			["贰"] = 按钮.卑弥呼界面_二层,
			["叁"] = 按钮.卑弥呼界面_三层,
		}
		操作.点击按钮(tBtn[参数.卑弥呼层数])
		mSleep(666)
	end

	操作.点击按钮(按钮.卑弥呼界面_组队按钮)
	mSleep(666) 
	return 卑弥呼界面.Next()
end

function 卑弥呼界面.to战斗准备界面()
	for i=1,5 do
		if 操作.识别2(标识.卑弥呼界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：卑弥呼面板')
	
	执行任务.检查副任务()
	
	if not 参数.使用默认层数 then
		local tBtn = 
		{
			["壹"] = 按钮.卑弥呼界面_一层,
			["贰"] = 按钮.卑弥呼界面_二层,
			["叁"] = 按钮.卑弥呼界面_三层,
		}
		操作.点击按钮(tBtn[参数.卑弥呼层数])
		mSleep(666)
	end
	
	操作.点击按钮(按钮.卑弥呼界面_挑战按钮)
	mSleep(666) 
	return 卑弥呼界面.Next()
end

function 卑弥呼界面.to探索界面()
	for i=1,5 do
		if 操作.识别2(标识.卑弥呼界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：卑弥呼面板')
	
	操作.点击按钮(按钮.卑弥呼界面_关闭按钮)
	mSleep(666)
	return 卑弥呼界面.Next()
end

