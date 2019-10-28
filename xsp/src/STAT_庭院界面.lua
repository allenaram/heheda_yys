---------------庭院界面---------------
庭院界面={to探索界面,to组队界面}

function 庭院界面.to探索界面()
	for i=1,5 do
		keepScreen(true)
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			break
		elseif i==5 then
			keepScreen(false)
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：庭院')
	
	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		keepScreen(false)
		庭院界面.开关buff()
	end
	
	操作.或识别点击({按钮.庭院界面_探索按钮1,按钮.庭院界面_探索按钮2,按钮.庭院界面_探索按钮3,按钮.庭院界面_探索按钮4,按钮.庭院界面_探索按钮5},false)
	keepScreen(false)
	mSleep(1500)
	return 庭院界面.Next()
end

function 庭院界面.to组队界面()
	for i=1,5 do
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2}) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：庭院')
	
	if 操作.识别2(标识.庭院界面_组队匹配中) then
		sysLog('排队中...')
		mSleep(2000)
		return 庭院界面.to组队界面()
	elseif not 操作.或识别({标识.庭院界面1,标识.庭院界面2}) then
		return 房间界面.to战斗准备界面（队员）()
	end
	
	mSleep(1500) -- 战斗结束进入庭院时，可能点不动按钮
	
	if 参数.交叉超鬼王 then
		执行任务.识别超鬼王()
	end
	
	if 参数.智能开关buff and 参数.调整开关buf=='关' then
		庭院界面.开关buff()
	end
	
	if not(参数.主任务) and (参数.自己发现的犬夜叉 or 参数.自己发现的年兽) then
		操作.或识别点击({按钮.庭院界面_探索按钮1,按钮.庭院界面_探索按钮2,按钮.庭院界面_探索按钮3,按钮.庭院界面_探索按钮4,按钮.庭院界面_探索按钮5},true)
		mSleep(2000)
		return 探索界面.切换主任务()
	end


	if (参数.交叉犬夜叉 and 参数.当前副任务=='犬夜叉' and 参数.犬夜叉挤车开金币buff) or
	   (参数.交叉年兽 and 参数.当前副任务=='年兽' and 参数.年兽挤车开金币buff) then
		参数.调整开关buff='开'
		参数.开关buff表.觉醒=false
		参数.开关buff表.御魂=false
		参数.开关buff表.金币=true
		参数.开关buff表.经验=false
	end
	
	if 操作.识别2(标识.庭院界面2) then
		操作.点击按钮(按钮.庭院界面_卷轴)
		mSleep(1000)
	end
	
	if 操作.识别2(标识.庭院界面1) then
		操作.点击按钮(按钮.庭院界面_组队按钮)
		mSleep(666)
		return 庭院界面.Next()
	else
		return 执行任务.重新识别()
	end
end

function 庭院界面.to超鬼王界面()
	for i=1,5 do
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2}) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：庭院')
	
	mSleep(1500)
	操作.识别点击(按钮.庭院界面_超鬼王按钮,false)
	mSleep(1000)
	return 庭院界面.Next()
end

function 庭院界面.to大江山之战界面()
	for i=1,5 do
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2}) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：庭院')
	
	mSleep(1500)
	操作.识别点击(按钮.庭院界面_大江山之战按钮,false)
	mSleep(1000)
	return 庭院界面.Next()
end

function 庭院界面.to离岛界面()
	for i=1,5 do
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2}) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：庭院')
	
	mSleep(1500)
	操作.识别点击(按钮.庭院界面_离岛按钮,false)
	mSleep(1000)
	return 庭院界面.Next()
end

function 庭院界面.to瞭望塔界面()
	for i=1,5 do
		keepScreen(true)
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			break
		elseif i==5 then
			keepScreen(false)
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：庭院')
	
	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		keepScreen(false)
		庭院界面.开关buff()
	end
	keepScreen(false)
	操作.识别点击(按钮.庭院界面_瞭望塔按钮)
	mSleep(1500)
	return 庭院界面.Next()
end

function 庭院界面.to式神录界面()
	for i=1,5 do
		keepScreen(true)
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			break
		elseif i==5 then
			keepScreen(false)
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：庭院')
	
	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		keepScreen(false)
		庭院界面.开关buff()
	end
	keepScreen(false)
	
	if 操作.识别2(标识.庭院界面2) then
		操作.点击按钮(按钮.庭院界面_卷轴)
		mSleep(1000)
	end
	
	if 操作.识别2(标识.庭院界面1) then
		操作.点击按钮(按钮.庭院界面_式神录)
		mSleep(666)
		return 庭院界面.Next()
	end
end

function 庭院界面.to召唤界面()
	for i=1,5 do
		keepScreen(true)
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			break
		elseif i==5 then
			keepScreen(false)
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：庭院')
	
	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		keepScreen(false)
		庭院界面.开关buff()
	end
	
	操作.或识别点击({按钮.庭院界面_召唤按钮1,按钮.庭院界面_召唤按钮2,按钮.庭院界面_召唤按钮3,按钮.庭院界面_召唤按钮4,按钮.庭院界面_召唤按钮5},false)
	keepScreen(false)
	mSleep(1500)
	return 庭院界面.Next()
end


function 庭院界面.开关buff()
	--sysLog('切换buff')
	操作.点击按钮(按钮.庭院界面_buff按钮)
	mSleep(666)
	buff界面.开关buff()
end

function 庭院界面.切换副任务()
	if 参数.交叉超鬼王 then
		mSleep(888)
		执行任务.识别超鬼王()
	end
	
	if 参数.交叉离岛 and 参数.主任务 and mTime()>=参数.离岛CD冷却时刻 then
		return 执行任务.切换离岛()
	end
	
	if 参数.交叉犬夜叉 and 参数.主任务 and (mTime()-参数.犬夜叉开始计时时刻)>1800000 then
		return 执行任务.切换犬夜叉()
	end
	
	if 参数.交叉年兽 and 参数.主任务 and (mTime()-参数.年兽开始计时时刻)>43200000 then
		return 执行任务.切换年兽()
	end
	
	if 参数.交叉寮突破 and not(参数.寮突已攻破) and 参数.主任务 and (mTime()-参数.寮突破开始计时时刻)>参数.寮突破间隔 then
		return 执行任务.切换寮突破()
	end

	if 参数.交叉个人突破 and 参数.主任务 and 参数.个人突破穿插依据=='CD冷却后切换' and (mTime()-参数.个人突破开始计时时刻)>参数.个人突破间隔 then
		return 执行任务.切换个人突破()
	end
end

function 庭院界面.结束主任务()
	for i=1,5 do
		if 操作.或识别({标识.庭院界面1,标识.庭院界面2},false) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：庭院')
	
	参数.调整开关buff='关'
	参数.开关buff表.觉醒=true
	参数.开关buff表.御魂=true
	参数.开关buff表.金币=true
	参数.开关buff表.经验=true
	庭院界面.开关buff()
	执行任务.结束主任务后操作()
end
----




