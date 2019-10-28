---------------召唤界面----------------
召唤界面={}

function 召唤界面.to抽N卡界面()
	for i=1,10 do
		if 操作.识别2(标识.召唤界面) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('当前位置：召唤界面')
	
	操作.点击按钮(按钮.召唤界面_N卡)
	mSleep(2000)
	
	return 召唤界面.Next()
end	


------------召唤准备界面-------------
召唤准备界面={}

function 召唤准备界面.to召唤界面()
	for i=1,10 do
		if 操作.识别2(标识.召唤准备界面) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	
	操作.点击按钮(按钮.召唤准备界面_返回)
	mSleep(500)
	return 召唤准备界面.Next()
end	