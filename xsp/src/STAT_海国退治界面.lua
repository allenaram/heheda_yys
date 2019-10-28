-----------海国退治界面------------
海国退治界面={to战斗准备界面,}

function 海国退治界面.to战斗准备界面()
	for i=1,15 do
		if 操作.识别2(标识.海国退治界面) then
			break
		elseif i==15 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:海国退治')
	
	操作.点击按钮(按钮.海国退治界面_挑战)
	sysLog("攻打鬼王")
	mSleep(3000)
	return 海国退治界面.Next()
end

function 海国退治界面.to大江山之战界面()
	for i=1,15 do
		if 操作.识别2(标识.海国退治界面) then
			break
		elseif i==15 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:海国退治')
	
	操作.点击按钮(按钮.海国退治界面_返回)
	mSleep(3000)
	return 海国退治界面.Next()
end