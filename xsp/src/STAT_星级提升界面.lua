---------------星级提升界面----------------
星级提升界面={}

function 星级提升界面.to式神录界面()
	for i=1,10 do
		if 操作.识别2(标识.星级提升界面) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('当前位置：升星成功')
	
	操作.点击按钮(按钮.星级提升界面_确定)
	育成界面.checkTimes()
	mSleep(666)
	return 星级提升界面.Next()
end	

function 星级提升界面.to育成界面()
	for i=1,10 do
		if 操作.识别2(标识.星级提升界面) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('当前位置：升星成功')
	
	操作.点击按钮(按钮.星级提升界面_继续升星)
	育成界面.checkTimes()
	mSleep(666)
	return 星级提升界面.Next()
end