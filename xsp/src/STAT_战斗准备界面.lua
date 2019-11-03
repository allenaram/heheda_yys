-------------战斗准备界面--------------
战斗准备界面={to战斗界面}

function 战斗准备界面.to战斗界面()
	for i=1,10 do
		if 操作.识别2(标识.战斗准备界面) then
			break
		elseif i==10 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：战斗准备')
	
	if 参数.狗粮未换 then
		if 操作.识别点击(按钮.战斗界面_头像齿轮,true) then
			mSleep(300)
			if not(操作.识别2(标识.战斗界面_小纸人)) then
				return 执行任务.重新识别() 
			end
			操作.识别点击(按钮.战斗界面_开关小纸人,true,0,0,0,0,true)
			mSleep(1000)
			操作.识别点击(按钮.战斗界面_头像齿轮)
		end
	end
	
	while true do
		if 操作.识别2(标识.战斗准备界面_未准备标识) then
			if 参数.换狗粮 and 参数.任务=='探索' and 参数.主任务 then
				战斗准备界面.换狗粮()
			end
			if 参数.御魂换狗粮 and (参数.任务=='大蛇' or 参数.任务=='业原火' or 参数.任务=='卑弥呼') 
			and 参数.主任务 then
				战斗准备界面.换狗粮（御魂）()
			end
			
			if 参数.交叉超鬼王 and not(参数.主任务) and 参数.超鬼王中 and not(参数.当前阵容==参数.切换阵容) then
				战斗准备界面.切换阵容()
			end
			
			if 参数.智能开关buff and 参数.调整开关buff~='保持' then
				战斗准备界面.开关buff()
			end
			
			操作.点击按钮(按钮.战斗准备界面_准备按钮)
			mSleep(666)
			break
		elseif 操作.识别2(标识.战斗准备界面_已准备标识) then
			break
		end
		
		if not(操作.识别2(标识.战斗准备界面)) then
			return 执行任务.重新识别()
		end
		
		mSleep(300*参数.延时倍数)
	end
	
	mSleep(200)
	
	while true do
		if not(操作.识别2(标识.战斗准备界面_已准备标识)) then 
			break
		end
		sysLog('等待队友准备......')
		if 参数.任务=='大蛇' and 参数.御魂点怪 and 参数.主任务 and not(已点怪) then	
			mSleep(200)
		else
			mSleep(1000)
		end
	end
	
	return 战斗准备界面.Next()
	
end

function 战斗准备界面.满级识别()
	while true do
		keepScreen(true)
		if 参数.狗粮表.左一 then
			local 左一满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,16,90,223,556}
			if (操作.识别2(左一满级标识)) then
				keepScreen(false)
				参数.狗粮未换=true
				break
			end
		end
		
		if 参数.狗粮表.中间 then
			local 中间满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,456,90,634,556}
			if (操作.识别2(中间满级标识)) then
				keepScreen(false)
				参数.狗粮未换=true
				break
			end
		end
		
		if 参数.狗粮表.右一 then
			local 右一满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,833,90,1054,556}
			if (操作.识别2(右一满级标识)) then 
				keepScreen(false)
				参数.狗粮未换=true
				break
			end
		end
		
		if 参数.狗粮表.左二 then
			local 左二满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,211,90,440,556}
			if (操作.识别2(左二满级标识)) then 
				keepScreen(false)
				参数.狗粮未换=true
				break 
			end
		end
		
		if 参数.狗粮表.右二 then
			local 右二满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,628,90,846,556}
			if (操作.识别2(右二满级标识)) then 
				keepScreen(false)
				参数.狗粮未换=true
				break 
			end
		end
		
		if not(操作.识别2(标识.战斗准备界面)) then
			return
		end
		
		if 操作.或识别({标识.战斗准备界面_未准备标识,标识.战斗准备界面_已准备标识},false) then
			break
		end
		
		keepScreen(false)
		mSleep(100)
	end
	
	if 参数.狗粮未换 then
		sysLog('发现狗粮满级')
		if 操作.识别点击(按钮.战斗界面_自动进队,true) then
			mSleep(300)
			操作.识别点击(按钮.战斗界面_自动进队已选中,true)
			mSleep(300)
			操作.点击按钮(按钮.战斗界面_退出自动进队切换)
		end
		return 战斗准备界面.to战斗界面()
	end
end

function 战斗准备界面.换狗粮()
	mSleep(300)
	keepScreen(true)
	if 参数.狗粮表.左前 then
		local 左前满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,135,136,348,383}
		参数.狗粮满级.右前满级 = 操作.识别2(左前满级标识) --参数.狗粮满级中的左右，是根据换狗粮界面来说的
	end
	
	if 参数.狗粮表.中前 then
		local 中前满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,338,189,543,439}
		参数.狗粮满级.中前满级 = 操作.识别2(中前满级标识)
	end
	
	if 参数.狗粮表.右前 then
		local 右前满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,549,271,793,499}
		参数.狗粮满级.左前满级 = 操作.识别2(右前满级标识)
	end
	
	if 参数.狗粮表.左后 then
		local 左后满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,0,226,209,455}
		参数.狗粮满级.右后满级 = 操作.识别2(左后满级标识)
	end
	
	if 参数.狗粮表.右后 then
		local 右后满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,328,393,570,640}
		参数.狗粮满级.左后满级 = 操作.识别2(右后满级标识)
	end
	keepScreen(false)
	
	if 参数.狗粮满级.左前满级 or 参数.狗粮满级.中前满级 or 参数.狗粮满级.右前满级 or 参数.狗粮满级.左后满级 or 参数.狗粮满级.右后满级 then
		for i=1,5 do
			操作.点击按钮(按钮.战斗准备界面_换狗粮按钮)
			mSleep(40)
		end
		sysLog('换狗粮')

		mSleep(1500)
		return 换狗粮界面.to战斗准备界面()
	end
end

function 战斗准备界面.换狗粮（御魂）()
	mSleep(300)
	local tManPattern
	if 参数.任务 ~= '卑弥呼' then
		tManPattern = 
		{
			["左一"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,16,274,223,490},
			["中间"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,456,243,634,485},
			["右一"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,833,254,1054,493},
			["左二"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,211,216,440,494},
			["右二"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,628,238,846,514},
		}
	else
		tManPattern = 
		{
			["左一"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,16,274,223,490},
			["中间"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,456,243,634,485},
			["右一"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,769,301,945,474},
			["左二"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,211,216,440,494},
			["右二"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,623,293,763,470},
		}
	end
	
	keepScreen(true)
	if 参数.狗粮表.左一 then
		参数.狗粮满级.右一满级 = 操作.识别2(tManPattern.左一) --参数.狗粮满级中的左右，是根据换狗粮界面来说的
	end
	
	if 参数.狗粮表.中间 then
		参数.狗粮满级.中间满级 = 操作.识别2(tManPattern.中间)
	end
	
	if 参数.狗粮表.右一 then
		参数.狗粮满级.左一满级 = 操作.识别2(tManPattern.右一)
	end
	
	if 参数.狗粮表.左二 then
		参数.狗粮满级.右二满级 = 操作.识别2(tManPattern.左二)
	end
	
	if 参数.狗粮表.右二 then
		参数.狗粮满级.左二满级 = 操作.识别2(tManPattern.右二)
	end
	keepScreen(false)
	
	if 参数.狗粮满级.左一满级 or 参数.狗粮满级.中间满级 or 参数.狗粮满级.右一满级 or 参数.狗粮满级.左二满级 or 参数.狗粮满级.右二满级 then
		for i=1,5 do
			操作.点击按钮(参数.任务=='卑弥呼' and 按钮.战斗准备界面_卑弥呼_换狗粮按钮 
							or 按钮.战斗准备界面_换狗粮按钮)
			mSleep(40)
		end
		sysLog('换狗粮')

		mSleep(1500)
		return 换狗粮界面.to战斗准备界面（御魂）()
	end
end

function 战斗准备界面.切换阵容()
	操作.点击按钮(按钮.战斗准备界面_切换阵容按钮)
	mSleep(1000)
	while true do
		if 操作.识别2(标识.战斗准备换阵容界面标识) then
			if 参数.切换阵容=='阵容1' then
				操作.点击按钮(按钮.战斗准备换阵容界面_阵容1)
			elseif 参数.切换阵容=='阵容2' then
				操作.点击按钮(按钮.战斗准备换阵容界面_阵容2)
			elseif 参数.切换阵容=='阵容3' then
				操作.点击按钮(按钮.战斗准备换阵容界面_阵容3)
			elseif 参数.切换阵容=='阵容4' then
				操作.点击按钮(按钮.战斗准备换阵容界面_阵容4)
			end
			mSleep(300)
			操作.点击按钮(按钮.战斗准备换阵容界面_出战)
			break
		elseif 操作.或识别({标识.战斗准备界面,标识.战斗界面}) then
			return 执行任务.重新识别()
		end
		
		mSleep(1000)
	end
	
	参数.当前阵容=参数.切换阵容
	mSleep(1000)
end

function 战斗准备界面.开关buff()
	sysLog('切换buff')
	操作.点击按钮(按钮.战斗准备界面_buff按钮)
	mSleep(666)
	buff界面.开关buff()
end