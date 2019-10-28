------------修罗战场界面------------
修罗战场界面={to战斗准备界面,}

local tDifficultyBtn = 
{
	['锻火'] = 按钮.修罗战场界面_难度1,
	['覆土'] = 按钮.修罗战场界面_难度2,
	['淬水'] = 按钮.修罗战场界面_难度3,
}

function 修罗战场界面.to战斗准备界面()
	for i=1,15 do
		if 操作.识别2(标识.修罗战场界面) then
			break
		elseif i==15 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:修罗战场')
	
	执行任务.检查副任务()

	local morale = 操作.字符识别({758,25,853,47}, 
					{"0x272420-0x3f3f3f"}, "0123456789/")
	morale = tonumber(Split(morale, '/', 2)[1]) or 100
	if morale < 参数.修罗战场_士气下限 then
		sysLog('等待士气恢复...')
		mSleep(10000)
		return 修罗战场界面.to战斗准备界面()
	end
	
	while 操作.识别点击(tDifficultyBtn[参数.修罗战场_难度]) do
		mSleep(888)
	end
	
	操作.点击按钮(按钮.修罗战场界面_挑战)
	mSleep(3000)
	return 修罗战场界面.Next();
end

function 修罗战场界面.to大江山之战界面()
	for i=1,15 do
		if 操作.识别2(标识.修罗战场界面) then
			break
		elseif i==15 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:修罗战场')
	
	操作.点击按钮(按钮.修罗战场界面_返回)
	mSleep(888)
	return 修罗战场界面.Next()
end

