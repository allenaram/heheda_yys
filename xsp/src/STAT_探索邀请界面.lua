-----------探索邀请界面-----------
探索邀请界面={to探索关卡界面,to探索准备界面}

function 探索邀请界面.to探索关卡界面()	
	for i=1,5 do
		if 操作.识别2(标识.探索邀请界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索邀请面板')
	
	if 参数.探索邀请目标=='寮友' then
		操作.点击按钮(按钮.探索邀请界面_寮友按钮)
	elseif 参数.探索邀请目标=='好友' then
		操作.点击按钮(按钮.探索邀请界面_好友按钮)
	elseif	参数.探索邀请目标=='跨区' then
		操作.点击按钮(按钮.探索邀请界面_跨区按钮)
	end
	mSleep(300*参数.延时倍数)
	
	for i=1,5 do
		if 操作.识别2(标识.探索邀请界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	
	参数.探索当前滑屏数=0
	参数.BOSS已挑战=0
	local 计时=8
	while true do
		if 计时==8 then
			if 参数.开始等待队友时刻<0 then
				参数.开始等待队友时刻=mTime()
			end
			if 参数.队友未响应结束主任务 then
				if mTime()-参数.开始等待队友时刻>180000 then
					参数.队友未响应=true
					参数.任务=' '
					执行任务.设置结束主任务流程()
					return 执行任务.结束主任务()
				end
			end
			
			if 参数.探索邀请目标=='固定队友' then
				固定队友_is_set=getNumberConfig("固定队友_is_set",-1)
				队友类型=getStringConfig("固定队友类型","好友")
				if 参数.重设固定好友 or 固定队友_is_set==-1 or 队友类型=='最近' then
					if 队友类型=='最近' then
						for i=1,5 do
							toast('检测到当前固定队友为最近队友，当前任务无法邀请最近队友，请重设固定队友！')
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
						setStringConfig("固定队友类型","寮友")
					elseif 操作.识别2(标识.邀请界面_好友分类2) then
						setStringConfig("固定队友类型","好友")
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
				if 队友类型=='好友' then
					操作.点击按钮(按钮.探索邀请界面_好友按钮)
				elseif 队友类型=='寮友' then
					操作.点击按钮(按钮.探索邀请界面_寮友按钮)
				elseif 队友类型=='跨区' then
					操作.点击按钮(按钮.探索邀请界面_跨区按钮)
				end
				mSleep(500)
				for i=1,5 do
					if 操作.识别2(标识.探索邀请界面) then
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
					if 操作.识别点击(固定好友) then 
						setScreenScale(640,1136)
						mSleep(500)
						break
					elseif page==10 then
						for i=1,5 do
							toast("找不到固定队友！")
							vibrator()
							mSleep(1500)
						end
						setScreenScale(640,1136)
						操作.点击按钮(按钮.探索邀请界面_邀请按钮)
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
					if 操作.识别(标识.探索邀请界面) then
						return 执行任务.重新识别()
					end
				end
				sysLog('选中固定好友')
			else
				if 操作.识别点击(按钮.探索邀请界面_好友1) then
					mSleep(500)
				end
			end
			
			操作.点击按钮(按钮.探索邀请界面_邀请按钮)
			计时=0
		end
		计时=计时+1
		mSleep(1000)
		if not(操作.识别2(标识.探索邀请界面)) then
			mSleep(1500)
			参数.开始等待队友时刻=-1
			return 探索邀请界面.Next()
		end		
	end
end


function 探索邀请界面.to探索准备界面()
	for i=1,5 do
		if 操作.识别2(标识.探索邀请界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索邀请面板')
	
	操作.点击按钮(按钮.探索邀请界面_关闭按钮)
	mSleep(300)
	
	return 探索准备界面.to探索界面()
end