--------------创建队伍界面-------------
创建队伍界面={to房间界面}

function 创建队伍界面.to房间界面()
	for i=1,5 do
		if 操作.识别2(标识.创建队伍界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：创建队伍面板')
	
	--选择建队类型
	mSleep(500)
	if 参数.队伍类型=='所有人' then
		操作.点击按钮(按钮.创建队伍界面_所有人按钮)
		mSleep(300)
	elseif 参数.队伍类型=='仅好友' then
		操作.点击按钮(按钮.创建队伍界面_仅好友按钮)
		mSleep(300)
	elseif 参数.队伍类型=='不公开' then
		操作.点击按钮(按钮.创建队伍界面_不公开按钮)
		mSleep(300)
	end
	----
	
	if not(操作.识别2(标识.创建队伍界面)) then
		return 执行任务.重新识别()
	end
	
	操作.点击按钮(按钮.创建队伍界面_创建按钮)
	参数.cnt=8
	mSleep(666)
	return 创建队伍界面.Next()

end

function 创建队伍界面.to组队界面()
	for i=1,5 do
		if 操作.识别2(标识.创建队伍界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：创建队伍面板')
	
	操作.点击按钮(按钮.创建队伍界面_取消按钮)
	mSleep(300*参数.延时倍数)
	return 创建队伍界面.Next()
end



-------------探索创建队伍界面------------
探索创建队伍界面 = {}

function 探索创建队伍界面.to房间界面()
	for i=1,5 do
		if 操作.识别2(标识.探索创建队伍界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：创建队伍面板')
	
	--选择建队类型
	mSleep(500)
	if 参数.队伍类型=='所有人' then
		操作.点击按钮(按钮.探索创建队伍界面_所有人按钮)
		mSleep(300)
	elseif 参数.队伍类型=='仅好友' then
		操作.点击按钮(按钮.探索创建队伍界面_仅好友按钮)
		mSleep(300)
	elseif 参数.队伍类型=='不公开' then
		操作.点击按钮(按钮.探索创建队伍界面_不公开按钮)
		mSleep(300)
	end
	----
	
	if not(操作.识别2(标识.探索创建队伍界面)) then
		return 执行任务.重新识别()
	end
	
	操作.点击按钮(按钮.探索创建队伍界面_创建按钮)
	参数.cnt=8
	mSleep(666)
	return 探索创建队伍界面.Next()
end