---------------鬼王创建队伍界面---------------
鬼王创建队伍界面={to房间界面}

function 鬼王创建队伍界面.to房间界面()
	for i=1,5 do
		if 操作.识别2(标识.鬼王创建队伍界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:创建队伍')
	
	操作.点击按钮(按钮.鬼王创建队伍界面_所有人)
	mSleep(666)
	操作.点击按钮(按钮.鬼王创建队伍界面_创建)
	mSleep(888)
	return 鬼王创建队伍界面.Next()
	
end