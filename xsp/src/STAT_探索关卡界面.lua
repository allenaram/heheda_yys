--------------探索关卡界面---------------
探索关卡界面={to战斗准备界面,to探索界面,to探索界面2,to重邀界面,领奖}

function 探索关卡界面.to战斗准备界面()
	for i=1,5 do
		if 操作.识别2(标识.探索关卡界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索关卡')
	
	for i=1,3 do
		if 操作.识别2(标识.探索关卡界面_发现boss标识) then
			sysLog('发现BOSS！')
			mSleep(1500)
			break
		end
		mSleep(200*参数.延时倍数)
	end
	
	local 找怪次数=0
	while true do
		if 参数.探索当前滑屏数>参数.探索滑屏总次数 or 参数.BOSS已挑战>1 then
			参数.探索当前滑屏数=0
			return 探索关卡界面.to探索关卡退出界面()
		end
		
		keepScreen(true)
		操作.识别点击(按钮.探索关卡界面_锁定式神按钮（已选中）)
		
		local 怪物={}
		local 怪物名单={}
		if 参数.探索选怪.打BOSS then
			--mSleep(1000) -- 发现BOSS前有延时
			if 操作.识别点击(按钮.探索关卡界面_BOSS匕首) then
				sysLog('攻打BOSS！')
				keepScreen(false)
				mSleep(1000)
				if not(操作.识别2(标识.探索关卡界面)) then
					参数.BOSS已挑战 = 参数.BOSS已挑战+1
					return 探索关卡界面.Next()
				else
					return 探索关卡界面.to战斗准备界面()
				end
			end
		end
		
		if 参数.BOSS已挑战>0 then
			sysLog('BOSS已击杀！')
			keepScreen(false)
--			mSleep(1500) -- 等待小纸人出现
--			return 探索关卡界面.to探索界面2()
			return 探索关卡界面.to探索关卡退出界面()
		end
		
		sysLog('找怪中......')
		if 参数.探索选怪.经验怪 then
			local 经验怪1={}
			local 经验怪2={}
			local 经验怪3={}
			经验怪1 = 操作.全识别(标识.探索关卡界面_经验怪1)
			经验怪2 = 操作.全识别(标识.探索关卡界面_经验怪2)
			经验怪3 = 操作.全识别(标识.探索关卡界面_经验怪3)
			if #经验怪1>0 then
				table.insert(怪物,经验怪1[1])
				table.insert(怪物名单,'经验怪')
			end
			for i=2,#经验怪1 do
				if math.abs(经验怪1[i].x-经验怪1[i-1].x)>5/1136*参数.设备宽 and math.abs(经验怪1[i].y-经验怪1[i-1].y)>5/640*参数.设备高 then
					table.insert(怪物,经验怪1[i])
					table.insert(怪物名单,'经验怪')
				end
			end
			经验怪1=nil
			if #经验怪2>0 then
				table.insert(怪物,经验怪2[1])
				table.insert(怪物名单,'经验怪')
			end
			for i=2,#经验怪2 do
				if math.abs(经验怪2[i].x-经验怪2[i-1].x)>5/1136*参数.设备宽 and math.abs(经验怪2[i].y-经验怪2[i-1].y)>5/640*参数.设备高 then
					table.insert(怪物,经验怪2[i])
					table.insert(怪物名单,'经验怪')
				end
			end
			经验怪2=nil
			if #经验怪3>0 then
				table.insert(怪物,经验怪3[1])
				table.insert(怪物名单,'经验怪')
			end
			for i=2,#经验怪3 do
				if math.abs(经验怪3[i].x-经验怪3[i-1].x)>5/1136*参数.设备宽 and math.abs(经验怪3[i].y-经验怪3[i-1].y)>5/640*参数.设备高 then
					table.insert(怪物,经验怪3[i])
					table.insert(怪物名单,'经验怪')
				end
			end
			经验怪3=nil
		end
		
		
		if 参数.探索选怪.金币怪 then
			local 金币怪1={}
			local 金币怪2={}
			金币怪1 = 操作.全识别(标识.探索关卡界面_金币怪1)
			金币怪2 = 操作.全识别(标识.探索关卡界面_金币怪2)
			if #金币怪1>0 then
				table.insert(怪物,{x=金币怪1[1].x+25,y=金币怪1[1].y})
				table.insert(怪物名单,'金币怪')
			end
			for i=2,#金币怪1 do
				if math.abs(金币怪1[i].x-金币怪1[i-1].x)>5/1136*参数.设备宽 and math.abs(金币怪1[i].y-金币怪1[i-1].y)>5/640*参数.设备高 then
					table.insert(怪物,{x=金币怪1[i].x+25,y=金币怪1[i].y})
					table.insert(怪物名单,'金币怪')
				end
			end
			金币怪1=nil
			if #金币怪2>0 then
				table.insert(怪物,{x=金币怪2[1].x-10,y=金币怪2[1].y})
				table.insert(怪物名单,'金币怪')
			end
			for i=2,#金币怪2 do
				if math.abs(金币怪2[i].x-金币怪2[i-1].x)>5/1136*参数.设备宽 and math.abs(金币怪2[i].y-金币怪2[i-1].y)>5/640*参数.设备高 then
					table.insert(怪物,{x=金币怪2[i].x-10,y=金币怪2[i].y})
					table.insert(怪物名单,'金币怪')
				end
			end
			金币怪2=nil
		end
		
		if 参数.探索选怪.御魂怪 then
			local 御魂怪1={}
			local 御魂怪2={}
			local 御魂怪3={}
			御魂怪1 = 操作.全识别(标识.探索关卡界面_御魂怪1)
			御魂怪2 = 操作.全识别(标识.探索关卡界面_御魂怪2)
			御魂怪3 = 操作.全识别(标识.探索关卡界面_御魂怪3)
			if #御魂怪1>0 then
				table.insert(怪物,御魂怪1[1])
				table.insert(怪物名单,'御魂怪')
			end
			for i=2,#御魂怪1 do
				if math.abs(御魂怪1[i].x-御魂怪1[i-1].x)>5/1136*参数.设备宽 and math.abs(御魂怪1[i].y-御魂怪1[i-1].y)>5/640*参数.设备高 then	
					table.insert(怪物,御魂怪1[i])
					table.insert(怪物名单,'御魂怪')
				end
			end
			御魂怪1=nil
			if #御魂怪2>0 then
				table.insert(怪物,御魂怪2[1])
				table.insert(怪物名单,'御魂怪')
			end
			for i=2,#御魂怪2 do
				if math.abs(御魂怪2[i].x-御魂怪2[i-1].x)>5/1136*参数.设备宽 and math.abs(御魂怪2[i].y-御魂怪2[i-1].y)>5/640*参数.设备高 then
					table.insert(怪物,御魂怪2[i])
					table.insert(怪物名单,'御魂怪')
				end
			end
			御魂怪2=nil
			if #御魂怪3>0 then
				table.insert(怪物,御魂怪3[1])
				table.insert(怪物名单,'御魂怪')
			end
			for i=2,#御魂怪3 do
				if math.abs(御魂怪3[i].x-御魂怪3[i-1].x)>5/1136*参数.设备宽 and math.abs(御魂怪3[i].y-御魂怪3[i-1].y)>5/640*参数.设备高 then
					table.insert(怪物,御魂怪3[i])
					table.insert(怪物名单,'御魂怪')
				end
			end
			御魂怪3=nil
		end
		
		for i=1,#怪物 do
			local 匕首按钮={0xdbdbfa,"-13|10|0xd7d7ec,15|-6|0xddddf5,-4|-4|0x415081,10|6|0x3a4374",95,怪物[i].x-160,怪物[i].y-200,怪物[i].x+160,怪物[i].y-35}
			local 战斗匕首={}
			local 最优匕首={x=-1,y=-1}
			local 最小距离=100000000000
			战斗匕首 = 操作.全识别(匕首按钮)
			for j=1,#战斗匕首 do
				local dx=math.abs(怪物[i].x-战斗匕首[j].x)
				local dy=math.abs(怪物[i].y-战斗匕首[j].y)
				local 距离=dx*dx+dy*dy
				if 距离<最小距离 and (参数.探索组队类型~='队长' or 战斗匕首[j].x>=100) then
					最优匕首=战斗匕首[j]
					最小距离=距离
				end
			end

			if 最优匕首.x>-1 then
				sysLog(string.format('发现%s!',怪物名单[i]))
				keepScreen(false)
				操作.点击(最优匕首)
				mSleep(1000)
				if not(操作.识别2(标识.探索关卡界面)) then
					return 探索关卡界面.Next()
				else
					return 探索关卡界面.to战斗准备界面()
				end
			end
		end
		keepScreen(false)
		
		找怪次数=找怪次数+1
		if 找怪次数==1 and 参数.探索当前滑屏数<参数.探索滑屏总次数 then
			if not(操作.识别2(标识.探索关卡界面)) then
				return 执行任务.重新识别()
			end
			sysLog('走两步！')
			操作.滑动(792,523,479,540,300)
			参数.探索当前滑屏数=参数.探索当前滑屏数+1
			找怪次数=0
		elseif 找怪次数==1 and 参数.探索当前滑屏数==参数.探索滑屏总次数 then
			参数.探索当前滑屏数=参数.探索当前滑屏数+1
		end
		
		mSleep(200*参数.延时倍数)
	end
	
end

function 探索关卡界面.to战斗准备界面（队员）()
	for i=1,5 do
		if 操作.识别2(标识.探索关卡界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索关卡')
	mSleep(1000)

	while true do
		keepScreen(true)
		
		if not(操作.识别2(标识.探索关卡界面)) then
			keepScreen(false)
			if 操作.识别2(标识.探索界面) then
				return 执行任务.等待邀请.等待()
			else
				mSleep(1000)
				return 探索关卡界面.Next()
			end
		end
		
		if not(操作.识别2(标识.探索关卡界面_队友标识)) then
			sysLog('队长走了')
			keepScreen(false)
			return 探索关卡界面.to探索关卡退出界面()
		end
		
		操作.识别点击(按钮.探索关卡界面_锁定式神按钮（已选中）) 
		
		keepScreen(false)
		mSleep(1000)
	end
end

function 探索关卡界面.to探索关卡退出界面()  -- 手动退出关卡
	for i=1,5 do
		if 操作.识别2(标识.探索关卡界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('退出关卡')
	
	操作.点击按钮(按钮.探索关卡界面_退出按钮)
	mSleep(666)
	return 探索关卡退出界面.退出()
end

function 探索关卡界面.to探索界面2() -- 自动退出关卡	
	for i=1,6 do
		if 操作.或识别({按钮.探索关卡界面_小纸人1,按钮.探索关卡界面_小纸人2}) then 
			探索关卡界面.领奖()
			break 
		end
		mSleep(250*参数.延时倍数)
	end
	
	return 探索界面.to探索准备界面()
end

--[[
function 探索关卡界面.to重邀界面() -- 队长自动退出关卡
	for i=1,6 do
		local 小纸人={x=-1,y=-1}
		小纸人 = 操作.识别(按钮.探索关卡界面_小纸人)
		if 小纸人.x>-1 then 
			探索关卡界面.领奖()
			break 
		end
		mSleep(250*参数.延时倍数)
	end
	
	参数.BOSS已挑战=0
	return 重邀界面.to探索邀请界面()
end
--]]

function 探索关卡界面.领奖()
	sysLog('领取小纸人奖励！')
	
	while true do
		if not(操作.或识别点击({按钮.探索关卡界面_小纸人1,按钮.探索关卡界面_小纸人2})) then 
			break 
		end
		mSleep(600*参数.延时倍数)
		if 操作.识别2(标识.探索关卡小纸人奖励界面) then
			操作.点击按钮(按钮.探索关卡小纸人奖励界面_退出区域)
			mSleep(300*参数.延时倍数)
		end
	end
	
	mSleep(2000) --等待自动退出关卡
	if 操作.识别2(标识.探索关卡界面) then
		return 探索关卡界面.to探索关卡退出界面()
	end
end
----

--------------探索关卡退出界面--------------
探索关卡退出界面={to探索界面}

function 探索关卡退出界面.退出()
	for i=1,5 do
		if 操作.识别2(标识.探索关卡退出界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('退出关卡')
	
	操作.点击按钮(按钮.探索关卡退出界面_确认按钮)
	mSleep(1500)
	return 探索关卡退出界面.Next()
	
end
----
