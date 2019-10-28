--------------战斗结算界面1--------------
战斗结算界面1={}

function 战斗结算界面1.to战斗结算界面2()
	sysLog('当前位置：战斗结算界面1')
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	for i=1,3 do   
		mSleep(math.random(40,60))
		操作.点击按钮(按钮.战斗结算界面1_结算区域)
	end
	mSleep(888)
	return 战斗结算界面1.Next()
end

----

--------------战斗结算界面2--------------
战斗结算界面2={}

function 战斗结算界面2.to重邀界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to房间界面()
	参数.cnt=0
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to大蛇界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to麒麟界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to神兽界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to探索关卡界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to业原火界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to个人突破界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to寮突破界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to庭院界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to修罗战场界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to战斗结束界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to道场（居酒屋）界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.to轮回秘境界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面2.领奖()
	for i=1,10 do
		if 操作.识别2(标识.战斗结算界面2) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：战斗结算界面2')
	
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	while true do
		for i=1,5 do
			操作.点击按钮(按钮.战斗结算界面2_结算区域)
			mSleep(math.random(40,60))				
			mSleep(666*参数.延时倍数)
			if not(操作.识别2(标识.战斗结算界面2)) then
				mSleep(200)
				if 参数.御魂超出上限 then
					if 操作.识别2(标识.战斗结算界面2_御魂超出上限) then
						操作.点击按钮(按钮.战斗结算界面2_御魂超出上限确定按钮)
						return 战斗胜利界面.Next()
					end
				end
				return 战斗结算界面2.Next()
			end
		end
		
		if 操作.识别2(标识.协作界面) then
			return 协作任务界面.处理()
		end
	end
	
end

----

--------------战斗结算界面3--------------
战斗结算界面3={}

function 战斗结算界面3.to重邀界面()
	战斗结算界面3.领奖()
end


function 战斗结算界面3.to大蛇界面()
	战斗结算界面3.领奖()
end


function 战斗结算界面3.to麒麟界面()
	战斗结算界面3.领奖()
end


function 战斗结算界面3.to神兽界面()
	战斗结算界面3.领奖()
end


function 战斗结算界面3.to探索关卡界面()
	战斗结算界面3.领奖()
end


function 战斗结算界面3.to业原火界面()
	战斗结算界面3.领奖()
end


function 战斗结算界面3.to个人突破界面()
	战斗结算界面3.领奖()
end


function 战斗结算界面3.to寮突破界面()
	战斗结算界面3.领奖()
end


function 战斗结算界面3.to庭院界面()
	战斗结算界面3.领奖()
end

function 战斗结算界面3.to修罗战场界面()
	战斗结算界面3.领奖()
end

function 战斗结算界面3.to战斗结束界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面3.to道场（居酒屋）界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面3.to轮回秘境界面()
	战斗结算界面2.领奖()
end

function 战斗结算界面3.领奖()
	sysLog('当前位置：战斗结算界面3')
	操作.点击按钮(按钮.战斗结算界面3_结算区域)
	mSleep(888)
	return 战斗结算界面3.Next()
end

----