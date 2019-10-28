---------------年兽界面---------------
年兽界面={to鬼王创建队伍界面}

function 年兽界面.to鬼王创建队伍界面()
	for i=1,5 do
		if 操作.识别2(标识.年兽界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:年兽面板')
	
	操作.点击按钮(按钮.年兽界面_组队按钮)
	mSleep(666)
	return 年兽界面.Next()
end