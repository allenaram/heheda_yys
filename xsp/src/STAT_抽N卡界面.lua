---------------抽N卡界面----------------
抽N卡界面={}

function 抽N卡界面.to抽N卡完成界面()
	for i=1,10 do
		keepScreen(true)
		if 操作.识别2(标识.抽N卡界面) and not 操作.识别2(标识.抽N卡完成界面) then
			keepScreen(false)
			break
		elseif i==10 then
			keepScreen(false)
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('当前位置：抽厕纸')
	
	操作.滑动(216,242,925,239,300,40,70,40,70)
	
	for i = 1, 5 do
		if 操作.识别2(标识.抽N卡完成界面) then
			return 抽N卡界面.Next()
		end
		mSleep(300*参数.延时倍数)
	end
	
	while 操作.识别点击(按钮.抽N卡界面_卡背) do
		mSleep(300)
	end
	return 抽N卡界面.Next()
end	



---------------抽N卡完成界面----------------
抽N卡完成界面={}

function 抽N卡完成界面.to抽N卡界面()
	for i=1,5 do
		if 操作.识别2(标识.抽N卡完成界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('当前位置：抽厕纸')

	参数.抽厕纸_当前数量 = 参数.抽厕纸_当前数量 + 5
	sysLog('已抽 '..参数.抽厕纸_当前数量..' 次')
	if 参数.抽厕纸_当前数量 >= 参数.抽厕纸_数量 then
		if 参数.提示信息 then
			syslog2("任务完成！");
		end
		for var = 1,2 do
			vibrator()
			mSleep(1000)
		end
		lua_exit()
	end
	
	操作.点击按钮(按钮.抽N卡完成界面_再次召唤)
	mSleep(300)
	return 抽N卡完成界面.Next()
end	