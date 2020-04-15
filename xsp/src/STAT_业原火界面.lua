------------业原火界面------------
业原火界面={to战斗准备界面}

function 业原火界面.to战斗准备界面()
	for i=1,5 do
		if 操作.识别2(标识.业原火界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:业原火面板')
	
	执行任务.检查副任务()
	
	mSleep(1000)
	
	local tTarRegion = 
	{
		['贪'] = {330,15,378,36},
		['嗔'] = {466,14,554,36},
		['痴'] = {643,15,731,36},
	}
	if 参数.体服 then
		tTarRegion = 
		{
			['贪'] = {356,25,409,46},
			['嗔'] = {500,25,555,45},
			['痴'] = {646,26,701,45},
		}
	end
	local text = 操作.字符识别(tTarRegion[参数.业原火层数], 
							{"0xddd5c3-0x4f4f4f"}, "0123456789")
	
	if text == '0' then
		mSleep(1000)
		操作.点击按钮(按钮.业原火界面_关闭按钮)
		if 参数.交叉寮突破 then
			for i=1,2 do
				sysLog('业原火券已用尽')
				mSleep(1000)
				sysLog('即将切换寮突破为主任务')
				mSleep(1000)
			end
			执行任务.切换寮突破为主任务()
		elseif 参数.交叉死神 then
			for i=1,2 do
				sysLog('个人突破券已用尽')
				mSleep(1000)
				sysLog('即将切换寮死神为主任务')
				mSleep(1000)
			end
			执行任务.切换死神为主任务()
		else
			syslog2("没有业原火券了！");
			for var = 1,2 do
				vibrator()
				mSleep(1000)
			end
			lua_exit()
		end		
	end
	
	local tBtn = 
	{
		['贪'] = 按钮.业原火界面_贪按钮,
		['嗔'] = 按钮.业原火界面_嗔按钮,
		['痴'] = 按钮.业原火界面_痴按钮,
	}
	操作.点击按钮(tBtn[参数.业原火层数])
	mSleep(666)
	操作.点击按钮(按钮.业原火界面_挑战按钮)
	mSleep(2000)
	return 业原火界面.Next()
end

function 业原火界面.to探索界面()
	for i=1,5 do
		if 操作.识别2(标识.业原火界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	
	操作.点击按钮(按钮.业原火界面_关闭按钮)
	mSleep(666)
	return 业原火界面.Next()
end


