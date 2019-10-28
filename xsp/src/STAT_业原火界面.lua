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
	
	mSleep(1000)
	
	local 业原火券识别区域 = {}
	if 参数.业原火层数=='贪' then
		业原火券识别区域={330,15,378,36}
		操作.点击按钮(按钮.业原火界面_贪按钮)
	elseif 参数.业原火层数=='嗔' then
		业原火券识别区域={466,14,554,36}
		操作.点击按钮(按钮.业原火界面_嗔按钮)
	elseif 参数.业原火层数=='痴' then
		业原火券识别区域={643,15,731,36}
		操作.点击按钮(按钮.业原火界面_痴按钮)
	end
	
	local ocr, msg = createOCR({type = "tesseract", })
	
	local colorTbl = binarizeImage({
		rect = 业原火券识别区域,
		diff = {"0xddd5c3-0x4f4f4f"}
	})
	local code, text = ocr:getText({
		data=colorTbl,
		whitelist = "0123456789" 
	})
	ocr:release()
	
	if trim(text)=='0' then
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
		elseif 参数.交叉犬夜叉 then
			for i=1,2 do
				sysLog('个人突破券已用尽')
				mSleep(1000)
				sysLog('即将切换寮犬夜叉为主任务')
				mSleep(1000)
			end
			执行任务.切换犬夜叉为主任务()
		else
			syslog2("没有业原火券了！");
			for var = 1,2 do
				vibrator()
				mSleep(1000)
			end
			lua_exit()
		end		
	end
	ocr:release()
	
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


