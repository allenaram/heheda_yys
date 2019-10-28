----------登录动画-----------
登录动画界面={}

function 登录动画界面.to公告界面()
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	while true do
		操作.点击按钮(按钮.登录动画界面_跳过动画)
		mSleep(math.random(2000,3000))
		if not(操作.识别2(标识.登录动画界面)) then
			return 公告界面.to登录界面1()
		end
	end
end
----


----------公告界面-----------
公告界面={}

function 公告界面.to登录界面1()
	sysLog('关闭公告')
	操作.点击按钮(按钮.公告界面_关闭按钮)
	mSleep(1000)
	return 公告界面.Next()
end
----


----------登录界面1-----------
登录界面1={}

function 登录界面1.to登录界面2()
	for i=1,5 do
		if 操作.识别2(标识.登录界面1) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('登录游戏...')
	
	操作.点击按钮(按钮.登录界面1_进入游戏按钮)
	mSleep(3000)
	return 登录界面1.Next()
end
----


----------登录界面2-----------
登录界面2={}

function 登录界面2.to庭院界面()
	for i=1,5 do
		if 操作.识别2(标识.登录界面2) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('登录游戏...')
	
	while true do
		if not(操作.识别2(标识.登录界面2)) then
			mSleep(3000)
			break
		end
	end
	
	for i=1,5 do
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2,标识.庭院活动界面}) then
			执行任务.设置流程()
			return 执行任务.主任务()
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
end

function 登录界面2.to登录界面3()
	for i=1,5 do
		if 操作.识别2(标识.登录界面2) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('登录游戏...')
	
--	if 操作.识别2(标识.登录界面2_一区多号) then
--		操作.点击按钮(按钮.登录界面2_选号按钮)
--		mSleep(1000)
--	end
	
	操作.点击按钮(按钮.登录界面2_进入游戏按钮)
	mSleep(3000)
	return 登录界面2.Next()
end
----


----------登录界面3-----------
登录界面3={}

function 登录界面3.to庭院界面()
	for i=1,5 do
		if 操作.识别2(标识.登录界面3) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('登录游戏...')
	
	while true do
		if not(操作.识别2(标识.登录界面3)) then
			mSleep(3000)
			break
		end
	end
	
	for i=1,5 do
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2,标识.庭院活动界面}) then
			执行任务.设置流程()
			return 执行任务.主任务()
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	
end
----