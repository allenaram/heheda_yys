--------------探索界面--------------
探索界面={to御魂界面,ro觉醒界面,to御灵界面,to探索准备界面,to庭院界面,to个人突破界面}

function 探索界面.to御魂界面()
	for i=1,5 do
		if 操作.识别2(标识.探索界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索地图')
	
	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		探索界面.开关buff()
	end
	
	if 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
		探索界面.切换副任务()
	end

	操作.点击按钮(按钮.探索界面_御魂按钮)
	mSleep(500) 
	return 探索界面.Next()
end

function 探索界面.to觉醒界面()
	for i=1,5 do
		if 操作.识别2(标识.探索界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索地图')
	
	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		探索界面.开关buff()
	end
	
	if 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
		探索界面.切换副任务()
	end

	操作.点击按钮(按钮.探索界面_觉醒按钮)
	mSleep(500) 
	return 探索界面.Next()
end

function 探索界面.to御灵界面()
	for i=1,5 do
		if 操作.识别2(标识.探索界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索地图')
	
	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		探索界面.开关buff()
	end
	
	if 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
		探索界面.切换副任务()
	end

	操作.点击按钮(按钮.探索界面_御灵按钮)
	mSleep(500) 
	return 探索界面.Next()
end

function 探索界面.to探索准备界面()
	for i=1,5 do
		if 操作.识别2(标识.探索界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索地图')
	
	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		探索界面.开关buff()
	end
	
	if 操作.识别2(标识.探索界面_探索发现) then
		if 参数.任务=='探索' and not(操作.识别点击(按钮.探索界面_宝箱发现,true)) then
			if 参数.交叉死神 then
				if 操作.识别点击(按钮.探索界面_死神发现,true) then 
					参数.自己发现的死神=true
					mSleep(1500)
					return 执行任务.切换死神()
				end
			end
			if 参数.交叉年兽 then
				if 操作.识别点击(按钮.探索界面_年兽发现,true) then 
					参数.自己发现的年兽=true
					mSleep(1500)
					return 执行任务.切换年兽()
				end
			end
			if 操作.识别2(标识.探索界面_探索发现_多页) then
				操作.滑动(68,191,86,96)
				mSleep(1000)
				if not(操作.识别点击(按钮.探索界面_宝箱发现,true)) then
					if 参数.交叉死神 then
						if 操作.识别点击(按钮.探索界面_死神发现,true) then 
							参数.自己发现的死神=true
							mSleep(2000)
							return 执行任务.切换死神()
						end
					end
					if 参数.交叉年兽 then
						if 操作.识别点击(按钮.探索界面_年兽发现,true) then 
							参数.自己发现的年兽=true
							mSleep(2000)
							return 执行任务.切换年兽()
						end
					end
				else
					mSleep(1500)
					return 战斗结算界面1.to战斗结算界面2()
				end
			end
		else
			mSleep(1500)
			return 战斗结算界面1.to战斗结算界面2()
		end
	end
	
	if 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
		探索界面.切换副任务()
	end
	
	local ocr, msg = createOCR({
		type = "tesseract",
		path = "res/", 
		lang = "chi",
		psm=8
	})
	
	while true do
		if 参数.探索章节=='最新章节' then
			操作.点击按钮(按钮.探索界面_最新章节)
			mSleep(1000)
			return 探索界面.Next()
		else
			探索界面.选择章节('从下到上',ocr)
			mSleep(666)
			探索界面.选择章节('从上到下',ocr)
		end
	end
end

function 探索界面.to庭院界面()
	for i=1,5 do
		if 操作.识别2(标识.探索界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索地图')


	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		探索界面.开关buff()
	end
	
	if 参数.交叉寮突破 or 参数.交叉个人突破 or 参数.交叉超鬼王 or 参数.交叉死神 then
		探索界面.切换副任务()
	end
	
	操作.点击按钮(按钮.探索界面_退出按钮)
	mSleep(2000)
	return 探索界面.Next()
end

function 探索界面.to个人突破界面()
	for i=1,5 do
		if 操作.识别2(标识.探索界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索地图')
	
	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		探索界面.开关buff()
	end

	操作.点击按钮(按钮.探索界面_突破按钮)
	mSleep(300)
	return 探索界面.Next()
end

function 探索界面.to超鬼王界面()
	for i=1,5 do
		if 操作.识别2(标识.探索界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索地图')

	if 参数.智能开关buff and 参数.调整开关buff=='关' then
		keepScreen(false)
		探索界面.开关buff()
	end
	
	if 操作.识别点击(按钮.探索界面_超鬼王按钮,true,10,10,0,40) then
		mSleep(1500)
		return 探索界面.Next()
	else
		操作.点击按钮(按钮.探索界面_退出按钮)
		return 庭院界面.to超鬼王界面()
	end
	
end

function 探索界面.切换主任务()
	for i=1,5 do
		if 操作.识别2(标识.探索界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索地图')
	
	if (参数.自己发现的死神 and 参数.死神自己发现开金币buff) or (参数.自己发现的年兽 and 参数.年兽自己发现开金币buff) then
		参数.调整开关buff='关'
		参数.开关buff表.觉醒=false
		参数.开关buff表.御魂=false
		参数.开关buff表.金币=true
		参数.开关buff表.经验=false
		探索界面.开关buff()
		参数.开关buff表.觉醒=参数.开关buff表_temp.觉醒
		参数.开关buff表.御魂=参数.开关buff表_temp.御魂
		参数.开关buff表.金币=参数.开关buff表_temp.金币
		参数.开关buff表.经验=参数.开关buff表_temp.经验
	end
	
	if 参数.开关buff表.觉醒 or 参数.开关buff表.御魂 or 参数.开关buff表.金币 or 参数.开关buff表.经验 then
		参数.智能开关buff=true
		参数.调整开关buff='开'
	end
	
	参数.自己发现的死神=false
	参数.自己发现的年兽=false
	参数.主任务=true
	执行任务.设置流程()
	if 参数.提示信息 then
		syslog2('切换主任务')
	end
	return 执行任务.主任务()
	
end

--功能函数
function 探索界面.选择章节(寻找方向,ocr)
	if 寻找方向=='从下到上' then
		x1=1011 y1=209 x2=1012 y2=526
		t=400
	elseif 寻找方向=='从上到下' then
		x1=1012 y1=526 x2=1011 y2=209
		t=400
	end
	
	for i=1,8 do
		local 章节按钮={x=-1,y=-1}
		local X=950
		keepScreen(true)
		for Y=600,124,-参数.探索选关步长/640*参数.设备高 do
			local colorTbl = binarizeImage({
				rect = {X,Y,X+155,Y+32},
				diff = {"0xf3eedc-0x2f2f2f"}
			})
			
			local code, text = ocr:getText({
				data=colorTbl,
				whitelist = "第一二三四五六七八九十章" 
			})
			
			if trim(text)==参数.探索章节 then
				--章节按钮={x=X+100/640*参数.设备高,y=Y+20/640*参数.设备高}
				章节按钮={x=X,y=Y+15/640*参数.设备高}
				ocr:release()
				keepScreen(false)
				操作.点击(章节按钮)
				mSleep(666)
				return 探索界面.Next()
			end
		end
		keepScreen(false)
		if not(操作.识别2(标识.探索界面)) then	
			return 执行任务.重新识别()
		end
		操作.滑动(x1,y1,x2,y2,t)
		mSleep(300)
	end
end

function 探索界面.切换副任务(wait)
	not_wait=not_wait or false
	if 参数.交叉超鬼王 then
		if not(not_wait) then
			mSleep(参数.超鬼王识别前等待)
		end
		执行任务.识别超鬼王()
	end
	
	if 参数.交叉离岛 and 参数.主任务 and mTime()>=参数.离岛CD冷却时刻 then
		return 执行任务.切换离岛()
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

	if 参数.交叉个人突破 and 参数.主任务 and 参数.个人突破穿插依据=='CD冷却后切换' then
		if (mTime()-参数.个人突破开始计时时刻)>参数.个人突破间隔 then
			return 执行任务.切换个人突破()
		end
	elseif 参数.交叉个人突破 and 参数.主任务 and 参数.个人突破穿插依据=='挑战券满后切换' then
		local ocr, msg = createOCR({
		type = "tesseract", 
		})
		local colorTbl = binarizeImage({
			rect = {660,15,688,36},
			diff = {"0xd9d1be-0x3f3f3f"}
		})
		local code, text = ocr:getText({
			data=colorTbl,
			whitelist = "0123456789" 
		})
		--sysLog("text = " .. trim(text))
		if trim(text)=='30' then
			ocr:release()
			return 执行任务.切换个人突破()
		end
	end
end

function 探索界面.结束主任务()
	for i=1,5 do
		if 操作.识别2(标识.探索界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：探索地图')
	
	参数.调整开关buff='关'
	参数.开关buff表.觉醒=true
	参数.开关buff表.御魂=true
	参数.开关buff表.金币=true
	参数.开关buff表.经验=true
	探索界面.开关buff()
	执行任务.结束主任务后操作()
end

function 探索界面.开关buff()
	sysLog('切换buff')
	操作.点击按钮(按钮.探索界面_buff按钮)
	mSleep(666)
	buff界面.开关buff()
end
----

------------buff界面------------
buff界面={开关buff}

function buff界面.开关buff()
	for i=1,5 do
		if 操作.识别2(标识.buff界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	
	while true do
		local 无遮挡=true
		if 操作.识别点击(按钮.拒绝邀请按钮,true) then
			无遮挡=false
		end
		if 无遮挡 then
			break
		end
		mSleep(1500)
	end
	
	if 参数.调整开关buff=='开' then
		sysLog('开启buff')
		if 参数.开关buff表.觉醒 then
			操作.识别点击(按钮.buff界面_觉醒关)
			mSleep(666)
		end
		if 参数.开关buff表.御魂 then
			操作.识别点击(按钮.buff界面_御魂关)
			mSleep(666)
		end
		if 参数.开关buff表.金币 then
			local 金币={}
			金币 = 操作.全识别(按钮.buff界面_金币关)
			for i=1,#金币 do
				if i==1 then
					操作.点击(金币[i])
					mSleep(666)
				elseif math.abs(金币[i].y-金币[i-1].y)>(15/640*参数.设备高) then
					操作.点击(金币[i])
					mSleep(666)
				end
			end
		end
		if 参数.开关buff表.经验 then
			local 经验={}
			经验 = 操作.全识别(按钮.buff界面_经验关)
			for i=1,#经验 do
				if i==1 then
					操作.点击(经验[i])
					mSleep(666)
				elseif math.abs(经验[i].y-经验[i-1].y)>(15/640*参数.设备高) then
					操作.点击(经验[i])
					mSleep(666)
				end
			end
		end
		
	elseif 参数.调整开关buff=='关' then
		sysLog('关闭buff')
		if 参数.开关buff表.觉醒 then
			操作.识别点击(按钮.buff界面_觉醒开)
			mSleep(666)
		end
		if 参数.开关buff表.御魂 then
			操作.识别点击(按钮.buff界面_御魂开)
			mSleep(666)
		end
		if 参数.开关buff表.金币 then
			local 金币={}
			金币 = 操作.全识别(按钮.buff界面_金币开)
			for i=1,#金币 do
				if i==1 then
					操作.点击(金币[i])
					mSleep(666)
				elseif math.abs(金币[i].y-金币[i-1].y)>(15/640*参数.设备高) then
					操作.点击(金币[i])
					mSleep(666)
				end
			end
		end
		if 参数.开关buff表.经验 then
			local 经验={}
			经验 = 操作.全识别(按钮.buff界面_经验开)
			for i=1,#经验 do
				if i==1 then
					操作.点击(经验[i])
					mSleep(666)
				elseif math.abs(经验[i].y-经验[i-1].y)>(15/640*参数.设备高) then
					操作.点击(经验[i])
					mSleep(666)
				end
			end
		end
	end
	
	操作.点击按钮(按钮.buff界面_退出区域)
	参数.调整开关buff='保持'
	mSleep(666)
end
----


