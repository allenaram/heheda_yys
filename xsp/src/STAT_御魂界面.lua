----------------御魂界面-----------------
御魂界面={to大蛇界面,to业原火界面}

function 御魂界面.to大蛇界面()
	for i=1,5 do
		if 操作.识别2(标识.御魂界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：御魂面板')
	
	操作.点击按钮(按钮.御魂界面_大蛇按钮)
	mSleep(300)
	return 御魂界面.Next()
	
end

function 御魂界面.to业原火界面()
	for i=1,5 do
		if 操作.识别2(标识.御魂界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：御魂面板')
	
	操作.点击按钮(按钮.御魂界面_业原火按钮)
	mSleep(300)
	return 御魂界面.Next()
	
end

function 御魂界面.to卑弥呼界面()
	for i=1,5 do
		if 操作.识别2(标识.御魂界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：御魂面板')
	
	操作.点击按钮(按钮.御魂界面_卑弥呼按钮)
	mSleep(300)
	return 御魂界面.Next()
	
end