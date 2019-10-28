------------道场（居酒屋）界面------------
道场（居酒屋）界面={to战斗准备界面,}

function 道场（居酒屋）界面.to战斗准备界面()
	for i=1,25 do
		if 操作.识别2(标识.道场（居酒屋）界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	if 参数.离岛副本~='御魂' then
		sysLog('当前位置:御心道场')
	else
		sysLog('当前位置：居酒屋')
	end
	
	if 参数.交叉超鬼王 then
		mSleep(参数.超鬼王识别前等待)
		执行任务.识别超鬼王()
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
	
	local ocr, msg = createOCR({
    type = "tesseract", 
	})
	local code, text
	while true do
		local colorTbl = binarizeImage({
			rect = {1055,17,1093,37},
			diff = {"0xdfd7c5-0x3f3f3f"}
		})
		code, text = ocr:getText({
			data=colorTbl,
			whitelist = "0123456789" 
		})
		if trim(text)=='' then
			toast('无法识别活力值，请隐藏悬浮窗等遮挡物！')
		else
			break
		end
		mSleep(2000)
	end
	
	ocr:release()

	if 参数.离岛副本~='御魂' then
		if tonumber(trim(text)) == nil then
			toast('无法识别活力值，请隐藏悬浮窗等遮挡物！')
			mSleep(3000)
			return 道场（居酒屋）界面.to战斗准备界面()
		end
		
		if tonumber(trim(text))<10 then
			if 参数.离岛消耗勾玉 and 参数.离岛CD时消耗勾玉 and mTime()<参数.离岛CD冷却时刻 then
				道场（居酒屋）界面.购买()
			end
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 离岛界面.to浮世澡堂界面()
		end
		
		if 参数.离岛副本=='经验' then
			操作.点击按钮(按钮.御心道场_经验)
		elseif 参数.离岛副本=='金币' then
			操作.点击按钮(按钮.御心道场_金币)
		else
			操作.点击按钮(按钮.御心道场_觉醒)
		end
		mSleep(777)
		
		if 参数.离岛难度 == '简单' then
			操作.点击按钮(按钮.御心道场_简单)
		elseif 参数.离岛难度 == '普通' then
			操作.点击按钮(按钮.御心道场_普通)
		else
			操作.点击按钮(按钮.御心道场_困难)
		end
		
	else
		if tonumber(trim(text))<12 then
			if 参数.离岛消耗勾玉 and 参数.离岛CD时消耗勾玉 and mTime()<参数.离岛CD冷却时刻 then
				道场（居酒屋）界面.购买()
			end
			操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
			mSleep(666)
			return 离岛界面.to浮世澡堂界面()
		end
		
		if 参数.离岛难度 == '简单' then
			操作.点击按钮(按钮.居酒屋_简单)
		elseif 参数.离岛难度 == '普通' then
			操作.点击按钮(按钮.居酒屋_普通)
		else
			操作.点击按钮(按钮.居酒屋_困难)
		end
	end
	mSleep(777)
	操作.点击按钮(按钮.道场（居酒屋）界面_挑战)
	mSleep(1500)
	return 道场（居酒屋）界面.Next()

end

function 道场（居酒屋）界面.to离岛界面()
	for i=1,15 do
		if 操作.识别2(标识.道场（居酒屋）界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	if 参数.离岛副本~='御魂' then
		sysLog('当前位置:御心道场')
	else
		sysLog('当前位置：居酒屋')
	end
	
	操作.点击按钮(按钮.道场（居酒屋）界面_关闭)
	mSleep(666)
	return 道场（居酒屋）界面.Next()
end

function 道场（居酒屋）界面.购买() --这里所有的离岛界面实际上是道场（居酒屋）界面，为复用方便不改了
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
	return 道场（居酒屋）界面.to战斗准备界面()
end