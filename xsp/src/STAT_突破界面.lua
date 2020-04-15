-----------个人突破界面-----------
个人突破界面={to个人突破准备界面,to寮突破界面}

function 个人突破界面.to个人突破准备界面()
	for i=1,5 do
		keepScreen(true)
		if 操作.识别2(标识.个人突破界面) then
			keepScreen(false)
			break
		elseif 操作.识别2(标识.战斗结算界面1) then
			keepScreen(false)
			return 战斗结算界面1.to战斗结算界面2()
		elseif i==5 then
			keepScreen(false)
			return 执行任务.重新识别()
		end
		keepScreen(false)
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：个人突破面板')
	
	if 参数.交叉超鬼王 then
		mSleep(参数.超鬼王识别前等待)
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
		操作.点击按钮(按钮.个人突破界面_阴阳寮按钮)
		mSleep(300)
		return 执行任务.切换寮突破()
	end
	
	while true do
		local 无遮挡=true
		--keepScreen(true)
--		if 操作.识别点击(按钮.真蛇消息关闭按钮,true) then
--			无遮挡=false
--		end
		if 操作.识别点击(按钮.拒绝邀请按钮,true) then
			无遮挡=false
		end
		--keepScreen(false)
		if 无遮挡 then
			break
		end
		mSleep(1500)
	end
	
	keepScreen(true)
	local ocr, msg = createOCR({
    type = "tesseract", 
	})
	local colorTbl = binarizeImage({
		rect = {362,544,385,563},
		diff = {"0x272420-0x3f3f3f"}
	})
	local code, text = ocr:getText({
		data=colorTbl,
		whitelist = "0123456789" 
	})
	ocr:release()
	--sysLog("text = " .. trim(text))
	if trim(text)=='0' then
		if 参数.交叉个人突破 then
			if 参数.任务=='突破' and 参数.突破方式=='寮突破' then
				sysLog('个人突破券已用尽，将不再执行该副任务')
				mSleep(3000)
				参数.交叉个人突破=false
				参数.主任务=true
				执行任务.设置流程()
				执行任务.启动任务()
			else
				个人突破界面.to探索界面()
			end
		elseif 参数.交叉寮突破 then
			for i=1,2 do
				sysLog('个人突破券已用尽')
				mSleep(1000)
				sysLog('即将切换寮突破为主任务')
				mSleep(1000)
			end
			执行任务.切换寮突破为主任务()
		elseif 参数.交叉死神 then
			for i=1,2 do
				sysLog('个人突破券已用尽')
				mSleep(1000)
				sysLog('即将切换死神为主任务')
				mSleep(1000)
			end
			执行任务.切换死神为主任务()
		else
			if 参数.提示信息 then
				syslog2("没有突破券了！");
			end
			for var = 1,2 do
				vibrator()
				mSleep(1000)
			end
			lua_exit()
		end
	end
	
	local 对象表={}
	for m=1,3 do
		对象表[m]={}
		for n=1,3 do
			对象表[m][n]=0
		end
	end
	
	for m=1,3 do
		for n=1,3 do
			local 击破标识={0x6b635a,"-1|22|0x6c645b,59|16|0xd5c5b4", 95, 316+(n-1)*306, 95+(m-1)*119, 399+(n-1)*306, 153+(m-1)*119}
			local 失败标识={0x2b0a02,"6|5|0x280805,18|16|0x3b0c04", 95, 346+(n-1)*306, 78+(m-1)*119, 414+(n-1)*306, 137+(m-1)*119}
			if 操作.识别2(击破标识) then
				对象表[m][n]=-1
			elseif 操作.识别2(失败标识) then
				对象表[m][n]=6
			else
				对象表[m][n]=0
			end
		end
	end
	
	for k=0,4 do
		for m=1,3 do
			for n=1,3 do
				if 对象表[m][n]==k then
					local 星级标识={0xb3a38d,"4|0|0xb3a38d,2|4|0xb3a28c", 95, 211+k*35+(n-1)*306, 153+(m-1)*119, 225+k*35+(n-1)*306, 168+(m-1)*119}
					if not(操作.识别2(星级标识)) then
						对象表[m][n]=k+1
					end
				end
			end
		end
	end
	
	--[[
	for m=1,3 do
		for n=1,3 do
			sysLog(string.format('第%d个：%d',(m-1)*3+n,对象表[m][n]))
		end
	end
	--]]

	keepScreen(false)
	
	local 已突破数量=0
	local 不突破数量=0
	for m=1,3 do
		for n=1,3 do
			if 对象表[m][n]==-1 then
				已突破数量=已突破数量+1
			elseif (对象表[m][n]>参数.个人突破最高勋章 or 对象表[m][n]<参数.个人突破最低勋章)  then
				不突破数量=不突破数量+1
			end
		end
	end
	
	local 满足刷新条件=false
	if 参数.个人突破刷新方式=='突破全部' then
		if (已突破数量+不突破数量)==9 then
			满足刷新条件=true
		end
	elseif 参数.个人突破刷新方式=='三胜刷新' then
		if 已突破数量>=3 or 不突破数量>6 then
			满足刷新条件=true
		end
	elseif 参数.个人突破刷新方式=='六胜刷新' then
		if 已突破数量>=6 or 不突破数量>3 then
			满足刷新条件=true
		end
	end
	
	if 满足刷新条件 then	
		if 操作.识别2(标识.个人突破界面_刷新CD冷却) then
			操作.点击按钮(按钮.个人突破界面_刷新按钮)
			mSleep(500)
			return 个人突破刷新界面.to个人突破界面()
		else
			sysLog('等待刷新CD......')
			mSleep(5000)
			return 个人突破界面.to个人突破准备界面() 
		end
	end
	
	if 参数.个人突破方向=='勋章多的' then
		for k=参数.个人突破最高勋章,参数.个人突破最低勋章,-1 do
			for m=1,3 do
				for n=1,3 do
					if 对象表[m][n]==k then
						操作.点击按钮({x1=255+(n-1)*306,y1=114+(m-1)*119,x2=382+(n-1)*306,y2=169+(m-1)*119})
						mSleep(888)
						return 个人突破界面.Next()
					end
				end
			end
		end
	elseif 参数.个人突破方向=='勋章少的' then
		for k=参数.个人突破最低勋章,参数.个人突破最高勋章,1 do
			for m=1,3 do
				for n=1,3 do
					if 对象表[m][n]==k then
						操作.点击按钮({x1=255+(n-1)*306,y1=114+(m-1)*119,x2=382+(n-1)*306,y2=169+(m-1)*119})
						mSleep(888)
						return 个人突破界面.Next()
					end
				end
			end
		end
	end
	
	return 执行任务.重新识别()
	
end

function 个人突破界面.to寮突破界面()
	for i=1,5 do
		if 操作.识别2(标识.个人突破界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：个人突破面板')
	
	操作.点击按钮(按钮.个人突破界面_阴阳寮按钮)
	mSleep(300)
	return 个人突破界面.Next()
end

function 个人突破界面.to探索界面()
	操作.点击按钮(按钮.个人突破界面_退出按钮)
	mSleep(1000)
	if 参数.个人突破穿插依据 then
		参数.个人突破开始计时时刻=mTime()
	end
	参数.主任务=true
	执行任务.设置流程()
	if 参数.智能开关buff then
		参数.调整开关buff='开'
	end
	if 参数.提示信息 then
		syslog2('切换主任务')
	end
	return 执行任务.主任务()
end
----


----------个人突破刷新界面---------
个人突破刷新界面={to个人突破界面}

function 个人突破刷新界面.to个人突破界面()
	for i=1,5 do
		if 操作.识别2(标识.个人突破刷新界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	
	操作.点击按钮(按钮.个人突破刷新界面_确定按钮)
	mSleep(888)
	return 个人突破界面.to个人突破准备界面()
end
----


----------个人突破准备界面---------
个人突破准备界面={to战斗准备界面,to个人突破界面}

function 个人突破准备界面.to战斗准备界面()
	for i=1,5 do
		if 操作.识别2(标识.个人突破准备界面) then
			break
		elseif 操作.识别点击(按钮.寮公告按钮) then
			mSleep(1000)
			return 执行任务.重新识别()
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('选中突破目标')
	
	while true do
		local 无遮挡=true
--		keepScreen(true)
--		if 	操作.识别点击(按钮.真蛇消息关闭按钮,true) then
--			无遮挡=false
--		end
		if 操作.识别点击(按钮.拒绝邀请按钮,true) then
			无遮挡=false
		end
		--keepScreen(false)
		if 无遮挡 then
			break
		end
		mSleep(1500)
	end
	
	操作.识别点击(按钮.个人突破准备界面_进攻按钮,false)
	mSleep(1500)
	return 个人突破准备界面.Next()
	
end

function 个人突破准备界面.to个人突破界面()
	sysLog('重新选择目标')
	操作.点击按钮(按钮.个人突破准备界面_退出区域)
	mSleep(500)
	return 个人突破界面.to个人突破准备界面()
end
----


------------寮突破界面-----------
寮突破界面={to寮突破准备界面}

function 寮突破界面.to寮突破准备界面()
	for i=1,5 do
		if 操作.识别2(标识.寮突破界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：寮突破面板')
	
	if 参数.交叉超鬼王 then
		mSleep(参数.超鬼王识别前等待)
		执行任务.识别超鬼王()
	end
	
	if 参数.交叉离岛 and 参数.主任务 and mTime()>=参数.离岛CD冷却时刻 then
		return 执行任务.切换离岛()
	end
	
	if 参数.交叉死神 and (mTime()-参数.死神开始计时时刻)>1800000 then
		return 执行任务.切换死神()
	end
	
	if 参数.交叉年兽 and (mTime()-参数.年兽开始计时时刻)>43200000 then
		return 执行任务.切换年兽()
	end
	
	while true do
		local 无遮挡=true
--		keepScreen(true)
--		if 	操作.识别点击(按钮.真蛇消息关闭按钮,true) then
--			无遮挡=false
--		end
		if 操作.识别点击(按钮.拒绝邀请按钮,true) then
			无遮挡=false
		end
		--keepScreen(false)
		if 无遮挡 then
			break
		end
		mSleep(1500)
	end
	
	if not(参数.检查寮) then
		参数.检查寮=true
		if not(操作.识别2(标识.寮突破界面_寮开启标识)) then
			sysLog('寮突破未开启！')
			if 参数.交叉寮突破 then
				return 寮突破界面.to探索界面()
			else
				参数.检查寮=false
				if 参数.寮突破CD重新计时 then
					参数.寮突破开始计时时刻=mTime()
				end
				while true do
					if 参数.交叉死神 and 参数.主任务 and (mTime()-参数.死神开始计时时刻)>1800000 then
						参数.寮突破CD重新计时=false
						return 执行任务.切换死神()
					end
					
					if 参数.交叉年兽 and 参数.主任务 and (mTime()-参数.年兽开始计时时刻)>43200000 then
						参数.寮突破CD重新计时=false
						return 执行任务.切换年兽()
					end
					
					if (mTime()-参数.寮突破开始计时时刻)>参数.寮突破间隔 then
						参数.寮突破CD重新计时=true
						return 执行任务.重新识别()
					end
					mSleep(3000)
				end
			end
		end
	end
	
	local diff=' '
	if not(操作.识别2(标识.寮突破界面_已攻破标识)) then
		diff={"0x2c2925-0x3f3f3f"}
	else
		diff={"0x272420-0x1f1f1f"}
	end
	
	local ocr, msg = createOCR({type = "tesseract",})
	
	while true do
		local colorTbl = binarizeImage({
			rect = {245,486,259,505},
			diff = diff
		})
		local code, text = ocr:getText({
			data=colorTbl,
			whitelist = "0123456" 
		})

		if trim(text)=='0' then
			sysLog('寮突CD中...')
			if 参数.交叉寮突破 then
				return 寮突破界面.to探索界面()
			else
				if 参数.寮突破CD重新计时 then
					参数.寮突破开始计时时刻=mTime()
				end
				while true do
					if 参数.交叉死神 and 参数.主任务 and (mTime()-参数.死神开始计时时刻)>1800000 then
						参数.寮突破CD重新计时=false
						return 执行任务.切换死神()
					end
					
					if 参数.交叉年兽 and 参数.主任务 and (mTime()-参数.年兽开始计时时刻)>43200000 then
						参数.年兽CD重新计时=false
						return 执行任务.切换年兽()
					end
					
					if (mTime()-参数.寮突破开始计时时刻)>参数.寮突破间隔 then
						参数.寮突破CD重新计时=true
						return 执行任务.重新识别()
					end
					mSleep(3000)
				end
			end
		end
		
		--找目标
		while true do
			local function 识别勋章(N,标识)
				if 参数.寮突破最高勋章>=N and 参数.寮突破最低勋章<=N then 
					if 操作.识别点击(标识,true,0,0,150,0) then
						sysLog(string.format('找到%d星目标',N))
						keepScreen(false)
						ocr:release()
						mSleep(500)
						return 寮突破界面.Next()
					end
				end
			end
			
			keepScreen(true)
			if not(操作.识别2(标识.寮突破界面)) then
				keepScreen(false)
				return 执行任务.重新识别()
			end
			
			if 操作.识别2(标识.寮突破界面_打完标识) then
				参数.寮突已攻破=true
				keepScreen(false)
				sysLog('没有可攻打对象！')
				mSleep(3000)
				if 参数.交叉寮突破 then
					return 寮突破界面.to探索界面()
				else
					lua_exit()
				end
			end
			
			if 参数.寮突破方向=='勋章多的' then
				识别勋章(5,标识.寮突破界面_五星标识)
				识别勋章(4,标识.寮突破界面_四星标识)
				识别勋章(3,标识.寮突破界面_三星标识)
				识别勋章(2,标识.寮突破界面_二星标识)
				识别勋章(1,标识.寮突破界面_一星标识)
				识别勋章(0,标识.寮突破界面_零星标识)
			elseif 参数.寮突破方向=='勋章少的' then
				识别勋章(0,标识.寮突破界面_零星标识)
				识别勋章(1,标识.寮突破界面_一星标识)
				识别勋章(2,标识.寮突破界面_二星标识)
				识别勋章(3,标识.寮突破界面_三星标识)
				识别勋章(4,标识.寮突破界面_四星标识)
				识别勋章(5,标识.寮突破界面_五星标识)
			end
			keepScreen(false)
			
			操作.滑动(875,570,881,260,400)
			mSleep(500)
		end
		----

	end
	
end

function 寮突破界面.to探索界面()
	操作.点击按钮(按钮.寮突破界面_退出按钮)
	mSleep(1000)
	参数.主任务=true
	参数.寮突破开始计时时刻=mTime()
	执行任务.设置流程()
	if 参数.智能开关buff then
		参数.调整开关buff='开'
	end
	if 参数.提示信息 then
		syslog2('切换主任务')
	end
	return 执行任务.主任务()
end
----


----------寮突破准备界面----------
寮突破准备界面={to战斗准备界面,to寮突破界面}

function 寮突破准备界面.to战斗准备界面()
	for i=1,5 do
		if 操作.识别2(标识.寮突破准备界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('选中目标')
	
	if not(操作.或识别点击({按钮.寮突破准备界面_进攻按钮（左列）,按钮.寮突破准备界面_进攻按钮（右列）},false)) then
		if 操作.识别点击(按钮.寮公告按钮) then
			mSleep(1000)
		end
		return 执行任务.重新识别()
	end	
	mSleep(1500)
	return 寮突破准备界面.Next()

end

function 寮突破准备界面.to探索界面()
	操作.点击按钮(按钮.寮突破准备界面_退出区域)
	mSleep(1000)
	操作.点击按钮(按钮.寮突破界面_退出按钮)
	mSleep(1000)
	return 执行任务.重新识别()
end
----


