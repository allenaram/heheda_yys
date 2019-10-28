---------------鬼王界面---------------
鬼王界面={to鬼王创建队伍界面}

function 鬼王界面.to鬼王创建队伍界面()
	while true do
		local 无遮挡=true
		if 操作.识别点击(按钮.拒绝邀请按钮,true) then
			无遮挡=false
		end
		if 无遮挡 then
			break
		end
		mSleep(1500)
	end
	
	for i=1,5 do
		if 操作.识别2(标识.鬼王界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:鬼王面板')
	
	操作.点击按钮(按钮.鬼王界面_组队按钮)
	mSleep(666)
	return 鬼王界面.Next()
end