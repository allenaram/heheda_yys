---------------房间界面----------------
房间界面={to战斗准备界面,to战斗准备界面（队员）,to创建队伍界面}

function 房间界面.to战斗准备界面()
	for i=1,10 do
		if 操作.识别2(标识.房间界面) then
			break
		elseif 操作.识别2(标识.重邀界面) then
			return 重邀界面.to房间界面()
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(600*参数.延时倍数)
	end
	sysLog('当前位置：房间')
	
	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		房间界面.开关buff()
	end
	
	if (参数.交叉犬夜叉 and 参数.自己发现的犬夜叉 and 参数.犬夜叉自己发现开金币buff) or 
	   (参数.交叉年兽 and 参数.自己发现的年兽 and 参数.年兽自己发现开金币buff) then
		参数.调整开关buff='开'
		参数.开关buff表.觉醒=false
		参数.开关buff表.御魂=false
		参数.开关buff表.金币=true
		参数.开关buff表.经验=false
	end
	
	while true do
		if 参数.交叉超鬼王 then
			mSleep(参数.超鬼王识别前等待)
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
		
		if 参数.队伍人数==3 and 参数.主任务 then
			if not 操作.或识别({按钮.房间界面_队员1邀请按钮,按钮.房间界面_队员2邀请按钮}) then
				break
			end
		elseif 参数.队伍人数==2 or not(参数.主任务) then 
			if not 操作.与识别({按钮.房间界面_队员1邀请按钮,按钮.房间界面_队员2邀请按钮}) then
				break
			end
		end
		
		sysLog('等待队员中......')
		
		if not(操作.识别2(标识.房间界面)) then
			return 执行任务.重新识别()
		end		
		
		--邀请队友
		if 参数.房间邀请 and 参数.主任务 then
			参数.cnt=参数.cnt+1
			if 参数.cnt>=10 then
				if 参数.队友未响应结束主任务 then
					if 参数.开始等待队友时刻<0 then
						参数.开始等待队友时刻=mTime()
					end
					if mTime()-参数.开始等待队友时刻>180000 then
						参数.队友未响应=true
						执行任务.设置结束主任务流程()
						return 执行任务.结束主任务()
					end
				end
				
				操作.或识别点击({按钮.房间界面_队员1邀请按钮,按钮.房间界面_队员2邀请按钮})
				mSleep(888)
				if 参数.房间邀请目标=='固定队友' then
					固定队友_is_set=getNumberConfig("固定队友_is_set",-1)
					队友类型=getStringConfig("固定队友类型","好友")
					if 参数.重设固定好友 or 固定队友_is_set==-1 or 队友类型=='寮友' then
						if 队友类型=='寮友' then
							for i=1,5 do
								toast('检测到当前固定队友为寮友，当前任务无法邀请寮友，请重设固定队友！')
								mSleep(1000)
							end
						end
						--记录
						local 选中目标={x=-1,y=-1}
						while true do
							toast('请选中固定队友！')
							选中目标=操作.识别(标识.邀请界面_选中好友)
							if 选中目标.x~=-1 then
								操作.点击(选中目标)
								mSleep(1000)
								if not 操作.识别2(标识.邀请界面_选中好友) then
									break
								end
							end
							mSleep(2000)
						end
						if 操作.识别2(标识.邀请界面_好友分类1) then
							setStringConfig("固定队友类型","好友")
						elseif 操作.识别2(标识.邀请界面_好友分类2) then
							setStringConfig("固定队友类型","最近")
						elseif 操作.识别2(标识.邀请界面_好友分类3) then
							setStringConfig("固定队友类型","跨区")
						end
						setScreenScale(参数.设备高,参数.设备宽)
						选中目标.x=math.floor(选中目标.x/640*参数.设备高)
						选中目标.y=math.floor(选中目标.y/1136*参数.设备宽)
						c1={x=math.floor(196/1136*参数.设备宽),y=math.floor(7/640*参数.设备高)}
						c2={x=math.floor(196/1136*参数.设备宽),y=math.floor(32/640*参数.设备高)}
						c3={x=math.floor(206/1136*参数.设备宽),y=math.floor(19/640*参数.设备高)}
						c4={x=math.floor(186/1136*参数.设备宽),y=math.floor(19/640*参数.设备高)}
						c5={x=math.floor(196/1136*参数.设备宽),y=math.floor(19/640*参数.设备高)}
						Color1=string.format("%#x",tostring(getColor(选中目标.x-c1.x,选中目标.y+c1.y)))
						Color2=string.format("%#x",tostring(getColor(选中目标.x-c2.x,选中目标.y+c2.y)))
						Color3=string.format("%#x",tostring(getColor(选中目标.x-c3.x,选中目标.y+c3.y)))
						Color4=string.format("%#x",tostring(getColor(选中目标.x-c4.x,选中目标.y+c4.y)))
						Color5=string.format("%#x",tostring(getColor(选中目标.x-c5.x,选中目标.y+c5.y)))
						if #Color1<8 then
							Color1='0x0'..string.format("%x",tostring(getColor(选中目标.x-c1.x,选中目标.y+c1.y)))
						end
						if #Color2<8 then
							Color2='0x0'..string.format("%x",tostring(getColor(选中目标.x-c2.x,选中目标.y+c2.y)))
						end
						if #Color3<8 then
							Color3='0x0'..string.format("%x",tostring(getColor(选中目标.x-c3.x,选中目标.y+c3.y)))
						end
						if #Color4<8 then
							Color4='0x0'..string.format("%x",tostring(getColor(选中目标.x-c4.x,选中目标.y+c4.y)))
						end
						if #Color5<8 then
							Color5='0x0'..string.format("%x",tostring(getColor(选中目标.x-c5.x,选中目标.y+c5.y)))
						end
						--para2=tostring(0)..'|'..tostring(25)..'|'..Color2..','..tostring(-10)..'|'..tostring(12)..'|'..Color3..','..tostring(10)..'|'..tostring(12)..'|'..Color4..','..tostring(0)..'|'..tostring(12)..'|'..Color5
						para2=tostring(c1.x-c2.x)..'|'..tostring(c2.y-c1.y)..'|'..Color2..','..tostring(c1.x-c3.x)..'|'..tostring(c3.y-c1.y)..'|'..Color3..','..tostring(c1.x-c4.x)..'|'..tostring(c4.y-c1.y)..'|'..Color4..','..tostring(c1.x-c5.x)..'|'..tostring(c5.y-c1.y)..'|'..Color5
						setStringConfig("固定好友_para1",Color1)
						setStringConfig("固定好友_para2",para2)
						
						setNumberConfig("固定队友_is_set",1)
						参数.重设固定好友=false
						sysLog('固定好友记录完毕')
						setScreenScale(640,1136)
					end
					
					--识别
					para1=getStringConfig("固定好友_para1",'????')
					para2=getStringConfig("固定好友_para2",'????')
					队友类型=getStringConfig("固定队友类型","好友")
					local tarClassPattern = {}
					if 队友类型=='好友' then
						操作.点击按钮(按钮.房间邀请界面_好友按钮)
						tarClassPattern = 标识.邀请界面_好友分类1
					elseif 队友类型=='最近' then
						操作.点击按钮(按钮.房间邀请界面_最近按钮)
						tarClassPattern = 标识.邀请界面_好友分类2
					elseif 队友类型=='跨区' then
						操作.点击按钮(按钮.房间邀请界面_跨区按钮)
						tarClassPattern = 标识.邀请界面_好友分类3
					end
					mSleep(500)
					for i=1,5 do
						if 操作.识别2(tarClassPattern) then
							break
						elseif i==5 then
							return 执行任务.重新识别()
						end
						mSleep(600*参数.延时倍数)
					end
					--local 固定好友={para1,para2,90,300,150,840,482}
					local 固定好友={para1,para2,95,0,0,参数.设备宽-1,参数.设备高-1}
					for page=1,10 do
						选中目标=操作.识别(标识.邀请界面_选中好友)
						if 选中目标.x~=-1 then
							操作.点击(选中目标)
							mSleep(1000)
						end
						setScreenScale(参数.设备高,参数.设备宽)
						mSleep(400)
						if 操作.识别点击(固定好友) then 
							setScreenScale(640,1136)
							mSleep(500)
							break
						elseif page==10 then
							for i=1,10 do
								toast("找不到固定队友！")
								vibrator()
								mSleep(1500)
							end
							setScreenScale(640,1136)
							操作.点击按钮(按钮.房间邀请界面_邀请按钮)
							return 执行任务.重新识别()
						else
							setScreenScale(640,1136)
							if page<=5 then
								操作.滑动(776,383,743,212,300)
							else
								操作.滑动(743,212,776,383,300)
							end
							mSleep(888)
						end
						if 操作.识别(标识.房间邀请界面) then
							return 执行任务.重新识别()
						end
					end
					sysLog('选中固定好友')
					mSleep(400)
					操作.点击按钮(按钮.房间邀请界面_邀请按钮)
				else
					房间邀请界面.选择邀请目标()
					if 参数.房间邀请人数=='2个' then
						房间邀请界面.邀请2人()
					elseif 参数.房间邀请人数=='1个' then
						房间邀请界面.邀请1人()
					end
				end
				参数.cnt=0
			end
		end
		----
		mSleep(500)
	end
	
	参数.开始等待队友时刻=-1
	操作.点击按钮(按钮.房间界面_开始战斗按钮)
	sysLog('开始战斗')
	mSleep(3000) 
	if 操作.或识别({标识.房间界面, 标识.房间邀请界面, 标识.房间退出界面, 标识.房间界面好友资料}) then
		return 执行任务.重新识别()
	end
	return 房间界面.Next()
	
end

function 房间界面.to战斗准备界面（队员）()
	for i=1,5 do
		if 操作.识别2(标识.房间界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(00*参数.延时倍数)
	end
	sysLog('当前位置：房间')
	参数.开始等待队友时刻=-1
	
--	if 参数.智能开关buff and 参数.调整开关buff~='保持' then
--		房间界面.开关buff()
--	end

	if 参数.交叉超鬼王 then
		mSleep(参数.超鬼王识别前等待)
		执行任务.识别超鬼王()
	end
	
	while true do
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
		
		sysLog('等待队长开启战斗')
		
		if not(操作.识别2(标识.房间界面)) then
			break
		end
		
		if 参数.任务=='妖气' or 
		   参数.任务=='犬夜叉' or 
		   参数.交叉犬夜叉 and not(参数.主任务) and ((mTime()-参数.犬夜叉开始计时时刻)>1800000 or 参数.自己发现的犬夜叉) or
		   参数.交叉年兽 and not(参数.主任务) and ((mTime()-参数.年兽开始计时时刻)>43200000 or 参数.自己发现的年兽) then
			if (not(参数.主任务) or 参数.任务=='妖气') and 操作.或识别({标识.房间界面_开始战斗按钮（激活）,标识.房间界面_开始战斗按钮（未激活）}) then
				sysLog('成为房主')
				参数.队伍人数 = 2
				return 房间界面.to战斗准备界面()
			end
		else
			if 操作.与识别({按钮.房间界面_队员1邀请按钮,按钮.房间界面_队员2邀请按钮}) then 
				sysLog('离开房间')
				return 房间界面.退出房间()
			end
		end
		
		mSleep(300)
	end
	mSleep(3000)
	房间界面.Next()
end

function 房间界面.退出房间()
	操作.点击按钮(按钮.房间界面_离开队伍按钮)
	mSleep(666)
	if not(操作.识别2(标识.房间退出界面)) then
		return 执行任务.重新识别()
	end

	操作.点击按钮(按钮.房间退出界面_确定按钮)
	sysLog('退出房间')
	mSleep(500)
	return 执行任务.重新识别()
end

function 房间界面.to探索界面()
	操作.点击按钮(按钮.房间界面_离开队伍按钮)
	mSleep(300)
	for i=1,5 do
		if 操作.识别2(标识.房间退出界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end

	操作.点击按钮(按钮.房间退出界面_确定按钮)
	sysLog('退出房间')
	mSleep(500)
	return 房间界面.Next()
end

function 房间界面.开关buff()
	操作.点击按钮(按钮.房间界面_buff按钮)
	mSleep(666)
	buff界面.开关buff()
end
----


-------------房间退出界面--------------
房间退出界面={to创建队伍界面}

function 房间退出界面.to创建队伍界面()
	sysLog('当前位置：房间-退出')
	mSleep(2000)  --留给用户2秒时间决定是否真的退出
	操作.点击按钮(按钮.房间退出界面_确定按钮)
	mSleep(500)
	return 房间退出界面.Next()
end
----


-------------房间邀请界面--------------
房间邀请界面={选择邀请目标,邀请1人,邀请2人}

function 房间邀请界面.选择邀请目标()
	for i=1,5 do
		if 操作.识别2(标识.房间邀请界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end

	if 参数.房间邀请目标=='好友' then
		操作.点击按钮(按钮.房间邀请界面_好友按钮)
	elseif 参数.房间邀请目标=='最近' then
		操作.点击按钮(按钮.房间邀请界面_最近按钮)
	elseif 参数.房间邀请目标=='跨区' then
		操作.点击按钮(按钮.房间邀请界面_跨区按钮)
	end
	mSleep(300*参数.延时倍数)
	
	for i=1,5 do
		if 操作.识别2(标识.房间邀请界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	
end

function 房间邀请界面.邀请2人()
	for i=1,5 do
		if 操作.识别2(标识.房间邀请界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('邀请好友')
	
	操作.点击按钮(按钮.房间邀请界面_好友1)
	mSleep(666)
	操作.点击按钮(按钮.房间邀请界面_好友2)
	mSleep(400)
	操作.点击按钮(按钮.房间邀请界面_邀请按钮)
end

function 房间邀请界面.邀请1人()
	for i=1,5 do
		if 操作.识别2(标识.房间邀请界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('邀请好友')
	
	操作.点击按钮(按钮.房间邀请界面_好友1) 
	mSleep(400)
	操作.点击按钮(按钮.房间邀请界面_邀请按钮)
end

function 房间邀请界面.to房间界面()
	sysLog('当前位置：房间-邀请')
	mSleep(2000) --给用户2秒的邀请时间
	操作.点击按钮(按钮.房间邀请界面_邀请按钮)
	mSleep(500)
	房间邀请界面.Next()
end
----


-----------房间界面好友资料------------
房间界面好友资料 = {}
function 房间界面好友资料.返回()
	for i=1,5 do
		if 操作.识别2(标识.房间界面好友资料) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	
	sysLog("误点好友资料，即刻返回")
	操作.点击按钮(按钮.房间界面好友资料_返回按钮)
	参数.cnt=8
	return 房间界面.to战斗准备界面()
end
----