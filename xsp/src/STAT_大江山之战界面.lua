------------大江山之战界面------------
大江山之战界面={to修罗战场界面,}

local tDungeonPattern = 
{
	["兵俑"] 		= 按钮.大江山之战界面_兵俑,
	["食发鬼"]   	= 按钮.大江山之战界面_食发鬼,
	["武士之灵"] 	= 按钮.大江山之战界面_武士之灵,
	["山兔"] 		= 按钮.大江山之战界面_山兔,
}

function 大江山之战界面.to修罗战场界面()
	for i=1,5 do
		if 操作.识别2(标识.大江山之战界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:大江山之战')
	
	执行任务.检查副任务()
	
	操作.点击按钮(按钮.大江山之战界面_修罗战场)
	mSleep(1500)
	
	for i=1,3 do
		if 操作.识别点击(tDungeonPattern[参数.修罗战场_副本]) then
			break
		end

		if i==3 then
			return 执行任务.重新识别()
		elseif i==1 then
			操作.滑动(977,588,353,587)
			mSleep(888)
		else
			操作.滑动(353,587,977,588)
			mSleep(888)
		end
		mSleep(1000)
	end
	mSleep(1000)
	return 大江山之战界面.Next();
end

function 大江山之战界面.to海国退治界面()
	for i=1,5 do
		if 操作.识别2(标识.大江山之战界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:大江山之战')
	
	执行任务.检查副任务()
	
	操作.识别点击(按钮.大江山之战界面_鬼船)
	mSleep(1500)
	return 大江山之战界面.Next();
end

function 大江山之战界面.to庭院界面()
	for i=1,5 do
		if 操作.识别2(标识.大江山之战界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:大江山之战')
	
	操作.点击按钮(按钮.大江山之战界面_返回)
	mSleep(888)
	return 大江山之战界面.Next()
end