---------------麒麟界面----------------
麒麟界面={to组队界面}

function 麒麟界面.to组队界面()
	for i=1,5 do
		if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2}) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：麒麟面板')
	
	local ocr, msg = createOCR({
		type = "tesseract",
		path = "res/", 
		lang = "chi",
		psm=6
	})
	
	while true do
		if 参数.使用默认层数 then
			操作.点击按钮(按钮.麒麟界面_组队按钮)
			mSleep(666) 
			return 麒麟界面.Next()
		end
		
		if 麒麟界面.选择层数('从上到下',ocr) then
			操作.点击按钮(按钮.麒麟界面_组队按钮)
			mSleep(666) 
			return 麒麟界面.Next()
		end
		if 麒麟界面.选择层数('从下到上',ocr) then
			操作.点击按钮(按钮.麒麟界面_组队按钮)
			mSleep(666) 
			return 麒麟界面.Next()
		end
		
		if not(操作.或识别({标识.麒麟界面1,标识.麒麟界面2}))then	
			ocr:release()
			return 执行任务.重新识别()
		end
	end
	
end

function 麒麟界面.to战斗准备界面()
	for i=1,5 do
		if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2}) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：麒麟面板')
	
	if 参数.交叉超鬼王 then
		mSleep(参数.超鬼王识别前等待)
		执行任务.识别超鬼王()
	end
	
	if 参数.交叉离岛 and 参数.主任务 and mTime()>=参数.离岛CD冷却时刻 then
		return 执行任务.切换离岛()
	end
	
	if 参数.交叉犬夜叉 and 参数.主任务 and 参数.犬夜叉CD then
		return 执行任务.切换犬夜叉()
	end
	
	if 参数.交叉寮突破 and not(参数.寮突已攻破) and 参数.主任务 and (mTime()-参数.寮突破开始计时时刻)>参数.寮突破间隔 then
		return 执行任务.切换寮突破()
	end
	
	if 参数.交叉个人突破 and 参数.主任务 and 参数.个人突破穿插依据=='CD冷却后切换' and 参数.个人突破CD then
		return 执行任务.切换个人突破()
	end
	
	local ocr, msg = createOCR({
		type = "tesseract",
		path = "res/", 
		lang = "chi",
		psm=6
	})
	
	while true do
		if 参数.使用默认层数 then
			操作.点击按钮(按钮.麒麟界面_挑战按钮)
			mSleep(2000)
			return 麒麟界面.Next()
		end
		
		if 麒麟界面.选择层数('从上到下',ocr) then
			操作.点击按钮(按钮.麒麟界面_挑战按钮)
			mSleep(2000)
			return 麒麟界面.Next()
		end
		if 麒麟界面.选择层数('从下到上',ocr) then
			操作.点击按钮(按钮.麒麟界面_挑战按钮)
			mSleep(2000)
			return 麒麟界面.Next()
		end
		
		if not(操作.或识别({标识.麒麟界面1,标识.麒麟界面2}))then	
			ocr:release()
			return 执行任务.重新识别()
		end
	end
	
end

function 麒麟界面.to探索界面()
	for i=1,5 do
		if 操作.或识别({标识.麒麟界面1,标识.麒麟界面2}) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：麒麟面板')
	
	操作.点击按钮(按钮.麒麟界面_关闭按钮)
	mSleep(666)
	return 麒麟界面.Next()
end

function 麒麟界面.层数识别预处理(X,Y)
	--图像二值化
	local colorTbl = binarizeImage({
		rect = {X,Y,X+27,Y+30},
		diff = {"0x282420-0x4f4f4f"}
	})
	--图像后处理
	for _, row in pairs(colorTbl) do
		local 无效行=true
		for n=1,#row do
			if row[n]==0 then
				无效行=false
				break
			end
		end
		if 无效行 then
			for n=1,#row do
				row[n]=0
			end
		end
	end
	
	local 全零行数=0
	for _, row in pairs(colorTbl) do
		local 全零行=true
		for n=1,#row do
			if row[n]==1 then
				全零行=false
				break
			end
		end
		if 全零行 then
			全零行数=全零行数+1
		end
	end
	local 字符有效=true
	--sysLog(string.format('全零行数：%d，总行数：%d',全零行数,#colorTbl))
	if 全零行数>(#colorTbl*3/4) then
		字符有效=false
	end
	return 字符有效,colorTbl
end

function 麒麟界面.选择层数(寻找方向,ocr)
	if 寻找方向=='从上到下' then	
		x1=430 y1=200 x2=430 y2=300
	elseif 寻找方向=='从下到上' then
		x1=430 y1=300 x2=430 y2=200
	end	
	
	local 层数按钮={x=333,y=115}
	for i=1,3 do
		local X=333
		keepScreen(true)
		for Y=350,115,-5/640*参数.设备高 do
			local 字符有效,colorTbl = 麒麟界面.层数识别预处理(X,Y)
			----
			if 字符有效 then
				code, text = ocr:getText({
					data=colorTbl,
					whitelist = "壹贰叁肆伍陆柒捌玖拾" 
				})
			end
			
			if trim(text)==参数.觉醒层数 then 
				层数按钮={x=X,y=Y+15}
				keepScreen(false)
				text=nil
				ocr:release()
				操作.点击(层数按钮)
				mSleep(500)
				return true
			end
		end
		keepScreen(false)
		操作.滑动(x1,y1,x2,y2,200)
		mSleep(600)
	end
end
