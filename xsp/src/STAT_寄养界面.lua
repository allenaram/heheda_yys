---------------寄养界面----------------
寄养界面={}

function 寄养界面.退出()
	for i=1,5 do
		if 操作.识别2(标识.寄养界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('误入寄养界面，即刻返回')
	
	操作.点击按钮(按钮.寄养界面_返回)
	mSleep(1000)
	return 执行任务.重新识别()
end