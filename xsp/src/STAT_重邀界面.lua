-------------重邀界面-------------
重邀界面={to房间界面,to探索界面}

function 重邀界面.to房间界面()
	for i=1,5 do
		if 操作.识别2(标识.重邀界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:重邀')
	
	if 参数.交叉离岛 and 参数.主任务 and mTime()>=参数.离岛CD冷却时刻 then
		操作.点击按钮(按钮.重邀界面_取消按钮)
		mSleep(2000)
		return 执行任务.切换离岛()
	end
	
	if 参数.交叉犬夜叉 and 参数.主任务 and (mTime()-参数.犬夜叉开始计时时刻)>1800000 then
		操作.点击按钮(按钮.重邀界面_取消按钮)
		mSleep(2000)
		return 执行任务.切换犬夜叉()
	end
	
	if 参数.交叉年兽 and 参数.主任务 and (mTime()-参数.年兽开始计时时刻)>43200000 then
		操作.点击按钮(按钮.重邀界面_取消按钮)
		mSleep(2000)
		return 执行任务.切换年兽()
	end
	
	if 参数.交叉寮突破 and not(参数.寮突已攻破) and 参数.主任务 and (mTime()-参数.寮突破开始计时时刻)>参数.寮突破间隔 then
		操作.点击按钮(按钮.重邀界面_取消按钮)
		mSleep(2000)
		执行任务.切换寮突破()
	end
	
	if 参数.交叉个人突破 and 参数.主任务 and 参数.个人突破穿插依据=='CD冷却后切换' and (mTime()-参数.个人突破开始计时时刻)>参数.个人突破间隔 then
		操作.点击按钮(按钮.重邀界面_取消按钮)
		mSleep(2000)
		return 执行任务.切换个人突破()
	end
	
	if 参数.默认邀请队友 and not(参数.狗粮未换) then
		操作.或识别点击({按钮.重邀界面_默认邀请按钮1,按钮.重邀界面_默认邀请按钮2})
		mSleep(500)
	end
	操作.点击按钮(按钮.重邀界面_确定按钮)
	mSleep(2000)
	参数.cnt=0
	return 重邀界面.Next()

end

function 重邀界面.to探索界面()
	for i=1,5 do
		if 操作.识别2(标识.重邀界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:重邀')
	
	操作.点击按钮(按钮.重邀界面_取消按钮)
	mSleep(2000)
	if 参数.任务=='大蛇' then
		return 探索界面.to御魂界面()
	elseif 参数.任务=='觉醒' then
		return 探索界面.to觉醒界面()
	end
end

function 重邀界面.to探索邀请界面()
	for i=1,10 do
		if 操作.识别2(标识.重邀界面) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置:重邀')
	参数.BOSS已挑战=0
	参数.探索当前滑屏数=0
	
	if 参数.交叉超鬼王 or 参数.交叉离岛 or 参数.交叉犬夜叉 or 参数.交叉年兽 and 参数.交叉寮突破 or 参数.交叉个人突破 then
		重邀界面.切换副任务()
	end
	
	操作.点击按钮(按钮.重邀界面_确定按钮)
	mSleep(300)
	return 重邀界面.Next()
end

function 重邀界面.切换副任务()
	if 参数.交叉超鬼王 then
		mSleep(参数.超鬼王识别前等待)
		执行任务.识别超鬼王()
	end

	if 操作.识别2(标识.重邀界面_宝箱发现) then
		操作.点击按钮(按钮.重邀界面_取消按钮)
		mSleep(666)
		return 执行任务.重新识别()
	end
	
	if 参数.交叉犬夜叉 and 参数.主任务 then
		if 操作.识别2(标识.重邀界面_犬夜叉发现) then
			操作.点击按钮(按钮.重邀界面_取消按钮)
			mSleep(666)
			return 执行任务.重新识别()
		end
	end
	
	if 参数.交叉离岛 and 参数.主任务 and mTime()>=参数.离岛CD冷却时刻 then
		操作.点击按钮(按钮.重邀界面_取消按钮)
		mSleep(666)
		return 执行任务.切换离岛()
	end

	if 参数.交叉犬夜叉 and 参数.主任务 and (mTime()-参数.犬夜叉开始计时时刻)>1800000 then
		操作.点击按钮(按钮.重邀界面_取消按钮)
		mSleep(666)
		return 执行任务.切换犬夜叉()
	end
	
	if 参数.交叉年兽 and 参数.主任务 then
		if 操作.识别2(标识.重邀界面_年兽发现) then
			操作.点击按钮(按钮.重邀界面_取消按钮)
			mSleep(666)
			return 执行任务.重新识别()
		end
	end
	
	if 参数.交叉年兽 and 参数.主任务 and (mTime()-参数.年兽开始计时时刻)>43200000 then
		操作.点击按钮(按钮.重邀界面_取消按钮)
		mSleep(666)
		return 执行任务.切换年兽()
	end
	
	if 参数.交叉寮突破 and not(参数.寮突已攻破) and 参数.主任务 and (mTime()-参数.寮突破开始计时时刻)>参数.寮突破间隔 then
		操作.点击按钮(按钮.重邀界面_取消按钮)
		mSleep(666)
		return 执行任务.切换寮突破()
	end

	if 参数.交叉个人突破 and 参数.主任务 and 参数.个人突破穿插依据=='CD冷却后切换' then
		if (mTime()-参数.个人突破开始计时时刻)>参数.个人突破间隔 then
			操作.点击按钮(按钮.重邀界面_取消按钮)
			mSleep(666)
			return 执行任务.切换个人突破()
		end
	elseif 参数.交叉个人突破 and 参数.主任务 and 参数.个人突破穿插依据=='挑战券满后切换' then
		local ocr, msg = createOCR({
		type = "tesseract", 
		})
		local colorTbl = binarizeImage({
			rect = {660,15,688,36},
			diff = {"0x56534b-0x3f3f3f"}
		})
		local code, text = ocr:getText({
			data=colorTbl,
			whitelist = "0123456789" 
		})
		--sysLog("text = " .. trim(text))
		if trim(text)=='30' then
			ocr:release()
			操作.点击按钮(按钮.重邀界面_取消按钮)
			mSleep(666)
			return 执行任务.切换个人突破()
		end
	end
end