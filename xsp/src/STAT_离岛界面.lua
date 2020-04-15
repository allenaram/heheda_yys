------------离岛界面------------
离岛界面={to道场（居酒屋）界面,}

function 离岛界面.to道场（居酒屋）界面()
	for i=1,15 do
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:离岛')
	
	if 参数.交叉超鬼王 then
		mSleep(参数.超鬼王识别前等待)
		执行任务.识别超鬼王()
	end
	
	if 参数.交叉死神 and 参数.主任务 and (mTime()-参数.死神开始计时时刻)>1800000 then
		return 执行任务.切换死神()
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

	if 参数.离岛副本~='御魂' then
		操作.点击按钮(按钮.离岛界面_道场)
	else
		操作.点击按钮(按钮.离岛界面_居酒屋)
	end
	
	mSleep(888)
	return 离岛界面.Next()

end

function 离岛界面.to浮世澡堂界面()
	for i=1,10 do
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:离岛')
	
	if not(参数.离岛泡澡次数用尽) and 参数.离岛免费泡澡 then
		sysLog('前往澡堂')
		操作.点击按钮(按钮.离岛界面_澡堂)
		mSleep(888)
		return 浮世澡堂界面.泡澡()
	elseif 参数.离岛消耗勾玉 then
		操作.点击按钮(按钮.离岛界面_购买)
		mSleep(666)
		for i=1,3 do
			if 操作.识别2(标识.离岛购买界面) then
				break
			elseif i==3 then
				return 执行任务.重新识别()
			end
			mSleep(666*参数.延时倍数)
		end
		sysLog('购买活力值')
		操作.点击按钮(按钮.离岛购买界面_购买)
		mSleep(1500)
		操作.点击按钮(按钮.离岛购买界面_购买确认)
		mSleep(666)
		return 离岛界面.to道场（居酒屋）界面()
	else
		if 参数.任务=='离岛之歌' then --主任务
			if 参数.交叉寮突破 then
				for i=1,2 do
					sysLog(' ')
					mSleep(1000)
					sysLog('即将切换寮突破为主任务')
					mSleep(1000)
				end
				执行任务.切换寮突破为主任务()
			elseif 参数.交叉死神 then
				for i=1,2 do
					sysLog(' ')
					mSleep(1000)
					sysLog('即将切换寮死神为主任务')
					mSleep(1000)
				end
				执行任务.切换死神为主任务()
			else
				syslog2("结束任务！")
				for var = 1,2 do
					vibrator()
					mSleep(1000)
				end
				lua_exit()
			end
		else --副任务
			syslog2("不再前往离岛！")
			操作.点击按钮(按钮.离岛界面_返回)
			mSleep(666)
			参数.主任务=true
			参数.交叉离岛=false
			执行任务.设置流程()
			if 参数.智能开关buff then
				参数.调整开关buff='开'
			end
			syslog2('切换主任务')
			return 执行任务.主任务()
		end
	end

end

function 离岛界面.to庭院界面()
	for i=1,15 do
		if 操作.或识别({标识.离岛界面,标识.离岛界面2},false) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:离岛')
	
	操作.点击按钮(按钮.离岛界面_返回)
	mSleep(888)
	return 离岛界面.Next()
end