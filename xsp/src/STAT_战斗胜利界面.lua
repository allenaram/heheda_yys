-------------战斗胜利界面--------------
战斗胜利界面={to战斗结算界面2}

function 战斗胜利界面.to战斗结算界面2()
	for i=1,10 do
		keepScreen(true)
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2, 标识.战斗胜利界面3},false) then
			keepScreen(false)
			break
		elseif 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.退出()
		elseif i==10 then
			keepScreen(false)
			return 执行任务.重新识别()
		end
		keepScreen(false)
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：战斗胜利')
	
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	for i=1,5 do   
		mSleep(math.random(100,200))
		操作.点击按钮(按钮.战斗胜利界面_结算区域)
	end
	--mSleep(1000)
	return 战斗胜利界面.Next()
end

function 战斗胜利界面.to超鬼王界面()
	for i=1,5 do
		keepScreen(true)
		if 操作.或识别({标识.战斗胜利界面1,标识.战斗胜利界面2},false) then
			keepScreen(false)
			break
		elseif 操作.识别2(标识.战斗失败界面) then
			keepScreen(false)
			return 战斗失败界面.退出()
		elseif i==5 then
			keepScreen(false)
			return 执行任务.重新识别()
		end
		keepScreen(false)
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：战斗胜利')
	
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	for i=1,2 do   
		mSleep(math.random(40,60))
		操作.点击按钮(按钮.战斗胜利界面_结算区域)
	end
	--mSleep(1000)
	return 战斗胜利界面.Next()
end


-------------战斗结束界面--------------
战斗结束界面={}

function 战斗结束界面.to海国退治界面()
	for i=1,10 do
		if 操作.识别2(标识.战斗结束界面) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：战斗结束')
	
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	for i=1,2 do   
		mSleep(math.random(100,200))
		操作.点击按钮(按钮.战斗结束界面_结算区域)
	end
	mSleep(1500)
	for i=1,3 do
		if 操作.识别2(标识.战斗结算界面2) then
			break
		elseif i==3 then
			mSleep(300)
			return 战斗结束界面.Next()
		end
		mSleep(300*参数.延时倍数)
	end
	return 战斗结算界面2.to战斗结束界面()
end