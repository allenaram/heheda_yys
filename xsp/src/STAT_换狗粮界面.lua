-------------换狗粮界面------------
换狗粮界面={to战斗准备界面,选稀有度,换狗粮}

function 换狗粮界面.to战斗准备界面()
	for i=1,7 do
		if 操作.识别2(标识.换狗粮界面) then
			break
		elseif i==7 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：换狗粮')
	
	if 操作.识别2(标识.换狗粮界面_御魂) then
		操作.点击按钮(按钮.换狗粮界面_关闭御魂)
		mSleep(888)
	end
	
	local 左前满级=false
	local 左后满级=false
	local 中前满级  =false
	local 右前满级=false
	local 右后满级=false
	
	keepScreen(true)
	if 参数.狗粮表.右前 then  -- 【战斗准备界面】的左右和这里是相反的
		local 左前满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,20,76,283,384}
		左前满级 = 操作.识别2(左前满级标识)
	end
	
	if 参数.狗粮表.右后 then  
		local 左后满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,155,95,444,321}
		左后满级 = 操作.识别2(左后满级标识)
	end
	
	if 参数.狗粮表.中前 then
		local 中前满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,461,28,669,380}
		中前满级 =	 操作.识别2(中前满级标识)
	end
	
	if 参数.狗粮表.左前 then
		local 右前满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,819,76,1074,388}
		右前满级 = 操作.识别2(右前满级标识)
	end
	
	if 参数.狗粮表.左后 then
		local 右后满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,619,115,1008,336}
		右后满级 = 操作.识别2(右后满级标识)
	end	
	
	keepScreen(false)

	换狗粮界面.选稀有度()	
	换狗粮界面.预翻页()
	
	if 左前满级 or 参数.狗粮满级.左前满级 then
		sysLog('换狗粮-左前')
		换狗粮界面.换狗粮('左前')
		mSleep(500)
	end		

	if 左后满级 or 参数.狗粮满级.左后满级 then
		sysLog('换狗粮-左后')
		换狗粮界面.换狗粮('左后')
		mSleep(500)
	end		

	if 中前满级 or 参数.狗粮满级.中前满级 then
		sysLog('换狗粮-中前')
		换狗粮界面.换狗粮('中前')	
		mSleep(500)
	end		

	if 右前满级 or 参数.狗粮满级.右前满级 then
		sysLog('换狗粮-右前')
		换狗粮界面.换狗粮('右前')
		mSleep(500)
	end

	if 右后满级 or 参数.狗粮满级.右后满级 then
		sysLog('换狗粮-右后')
		换狗粮界面.换狗粮('右后')
	end
	
	参数.狗粮满级.右前满级=false
	参数.狗粮满级.右后满级=false
	参数.狗粮满级.中前满级=false
	参数.狗粮满级.左前满级=false
	参数.狗粮满级.左后满级=false
	
	if not(操作.识别2(标识.换狗粮界面)) then
		return 执行任务.重新识别()
	end
	
	操作.点击按钮(按钮.换狗粮界面_返回按钮)
	mSleep(1500)
	return 换狗粮界面.Next()

end


function 换狗粮界面.to战斗准备界面（御魂）()
	for i=1,7 do
		if 操作.识别2(标识.换狗粮界面) then
			break
		elseif i==7 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	sysLog('当前位置：换狗粮')
	
	local 左一满级=false
	local 左二满级=false
	local 中间满级  =false
	local 右二满级=false
	local 右一满级=false
	
	local tManPattern
	if 参数.任务~="卑弥呼" then
		tManPattern = 
		{
			["左一"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,0,64,191,338},
			["左二"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,186,74,433,346},
			["中间"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,401,69,698,350},
			["右一"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,904,59,1133,339},
			["右二"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,675,78,930,356},
		}
	else
		tManPattern = 
		{
			["左一"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,125,160,275,318},
			["左二"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,303,185,459,326},
			["中间"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,486,158,646,334},
			["右一"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,670,203,776,333},
			["右二"] = {0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度,833,184,994,365},
		}
	end
	
	keepScreen(true)
	if 参数.御魂狗粮表.右一 then  -- 【战斗准备界面】的左右和这里是相反的
		左一满级 = 操作.识别2(tManPattern.左一)
	end
	
	if 参数.御魂狗粮表.右二 then  
		左二满级 = 操作.识别2(tManPattern.左二)
	end
	
	if 参数.御魂狗粮表.中间 then
		中间满级 = 操作.识别2(tManPattern.中间)
	end
	
	if 参数.御魂狗粮表.左一 then
		右一满级 = 操作.识别2(tManPattern.右一)
	end
	
	if 参数.御魂狗粮表.左二 then
		右二满级 = 操作.识别2(tManPattern.右二)
	end	
	
	keepScreen(false)

	换狗粮界面.选稀有度()	
	换狗粮界面.预翻页()
	
	if 左一满级 or 参数.狗粮满级.左一满级 then
		sysLog('换狗粮-左一')
		换狗粮界面.换狗粮('左一')
		mSleep(500)
	end		

	if 左二满级 or 参数.狗粮满级.左二满级 then
		sysLog('换狗粮-左二')
		换狗粮界面.换狗粮('左二')
		mSleep(500)
	end		

	if 中间满级 or 参数.狗粮满级.中间满级 then
		sysLog('换狗粮-中间')
		换狗粮界面.换狗粮('中间')	
		mSleep(500)
	end		

	if 右二满级 or 参数.狗粮满级.右二满级 then
		sysLog('换狗粮-右二')
		换狗粮界面.换狗粮('右二')
		mSleep(500)
	end

	if 右一满级 or 参数.狗粮满级.右一满级 then
		sysLog('换狗粮-右一')
		换狗粮界面.换狗粮('右一')
	end
	
	参数.狗粮满级.右一满级=false
	参数.狗粮满级.右二满级=false
	参数.狗粮满级.中间满级=false
	参数.狗粮满级.左二满级=false
	参数.狗粮满级.左一满级=false
	
	if not(操作.识别2(标识.换狗粮界面)) then
		return 执行任务.重新识别()
	end
	
	操作.点击按钮(按钮.换狗粮界面_返回按钮)
	mSleep(1500)
	参数.狗粮未换=false
	return 换狗粮界面.Next()

end


function 换狗粮界面.预翻页()
	if 参数.狗粮预翻页>0 then 
		local 翻页终点={x=617*参数.狗粮预翻页/100+166,y=613}
		local 预翻页按钮={x=-1,y=-1}
		预翻页按钮 = 操作.识别(按钮.换狗粮界面_狗粮预翻页按钮)
		if 预翻页按钮.x>-1 then
			sysLog('狗粮预翻页！')
			操作.滑动(预翻页按钮.x,预翻页按钮.y,翻页终点.x,翻页终点.y,400)
			mSleep(500)
		end
	end
end


function 换狗粮界面.选稀有度()	
	操作.点击按钮(按钮.换狗粮界面_选稀有度按钮)
	mSleep(500)
	选稀有度界面.选稀有度()
end


function 换狗粮界面.换狗粮(狗粮位)
	local 拖动终点={x=-1,y=-1}
	local tTarRegion = 
	{
		["左后"] = {x=287,y=327},
		["左前"] = {x=181,y=323},
		["中前"] = {x=568,y=333},
		["右后"] = {x=823,y=320},
		["右前"] = {x=956,y=350},
	}
	if 参数.任务 == "大蛇" or 参数.任务 == "业原火" then
		tTarRegion["左一"] = {x=57,y=300}
		tTarRegion["左二"] = {x=292,y=297}
		tTarRegion["中间"] = {x=537,y=312}
		tTarRegion["右二"] = {x=818,y=331}
		tTarRegion["右一"] = {x=1075,y=278}
	elseif 参数.任务 == "卑弥呼" then
		tTarRegion["左一"] = {x=227,y=351}
		tTarRegion["左二"] = {x=383,y=356}
		tTarRegion["中间"] = {x=566,y=351}
		tTarRegion["右二"] = {x=740,y=358}
		tTarRegion["右一"] = {x=906,y=347}
	end
	
	while true do
		local 换好狗粮=false
		local 狗粮={}
		keepScreen(true)
		狗粮 = 操作.全识别(按钮.换狗粮界面_狗粮卡)
		if #狗粮==0 then
			keepScreen(false)
			return 执行任务.重新识别()
		end
		
		--按x从小到大排
		temp={x=-1,y=-1}
		for i=1,#狗粮-1 do
			for j=1,#狗粮-i do
				if 狗粮[j].x>狗粮[j+1].x then
					temp=狗粮[j]
					狗粮[j]=狗粮[j+1]
					狗粮[j+1]=temp
				end
			end
		end

		--删除重复的
		for i=#狗粮,2,-1 do
			if math.abs(狗粮[i].x-狗粮[i-1].x)<80*参数.设备宽/1136 then
				table.remove(狗粮,i)
			end
		end
		
		for i=1,#狗粮 do
			local 已经不满足=false
			local 满级={x=-1,y=-1}
			local 战斗中={x=-1,y=-1}
			local 观战中={x=-1,y=-1}
			local 白蛋={x=-1,y=-1}
			local 红蛋={x=-1,y=-1}
			local 蓝蛋={x=-1,y=-1}
			local 改名式神={x=-1,y=-1}
			卡满级标识={0x342312,"2|0|0xff9d1a,5|0|0x2d1f12,9|1|0xffa219,12|1|0xffa219,16|0|0x2a1d12,1|6|0xfbba11,9|5|0xffb713,13|4|0xffb114,2|12|0xefd207,6|11|0xfcd908,11|10|0xcfad0c,16|11|0xffdc08", 参数.满级识别度, 狗粮[i].x-28, 狗粮[i].y-150, 狗粮[i].x+4, 狗粮[i].y-117}
			卡战斗中标识={0xb72322,"-11|11|0xa22121,11|12|0xa62020,1|12|0xfef7ef,7|6|0xffffff", 88, 狗粮[i].x+46 , 狗粮[i].y-76, 狗粮[i].x+83, 狗粮[i].y-40}
			卡观战中标识={0x1a5172,"0|26|0x225374,-1|14|0xe2f2f2,6|23|0x256687,-6|4|0x246c8d", 88, 狗粮[i].x+46 , 狗粮[i].y-76, 狗粮[i].x+83, 狗粮[i].y-40}
			白蛋标识={0xffffff,"9|0|0xffffff,20|0|0xffffff", 90, 狗粮[i].x-3 , 狗粮[i].y-123, 狗粮[i].x+67, 狗粮[i].y-99}
			红蛋标识={0xf66857,"7|0|0xfc745e,16|1|0xf86c59", 90, 狗粮[i].x-3 , 狗粮[i].y-123, 狗粮[i].x+67, 狗粮[i].y-99}
			蓝蛋标识={0x80b0d7,"7|1|0x9ac2e0,17|1|0x71a1d0", 90, 狗粮[i].x-3 , 狗粮[i].y-142, 狗粮[i].x+67, 狗粮[i].y-116}
			改名标识={0xa5361e,"4|0|0xa8371f,1|3|0xa8371f,-3|103|0xa7361e,0|103|0xa6361e", 90, 狗粮[i].x-11 , 狗粮[i].y-136, 狗粮[i].x+9, 狗粮[i].y+117}
			if (参数.不上白蛋 or 参数.只上白蛋)and not 已经不满足 then 
				白蛋 = 操作.识别(白蛋标识)
				if 参数.不上白蛋 and 白蛋.x>-1 then
					已经不满足=true
				end
				if 参数.只上白蛋 and 白蛋.x==-1 then
					已经不满足=true
				end
				if 参数.只上白蛋 then
					if 白蛋.x>-1 then 白蛋.x=-1
					elseif 白蛋.x==-1 then 白蛋.x=1
					end
				end
			end
			if (参数.不上改名式神 or 参数.只上改名式神) and not 已经不满足 then
				改名式神	= 操作.识别(改名标识)
				if 参数.不上改名式神 and 改名式神.x>-1 then 
					已经不满足=true 
				end
				if 参数.只上改名式神 and 改名式神.x==-1 then
					已经不满足=true
				end
				if 参数.只上改名式神 then 
					if 改名式神.x>-1 then 改名式神.x=-1
					elseif 改名式神.x==-1 then 改名式神.x=1
					end
				end
			end
			if 参数.不上红蛋 and not 已经不满足 then 
				红蛋 = 操作.识别(红蛋标识)
				if 红蛋.x>-1 then 已经不满足=true end
			end
			if 参数.不上蓝蛋 and not 已经不满足 then 
				蓝蛋 = 操作.识别(蓝蛋标识)
				if 蓝蛋.x>-1 then 已经不满足=true end
			end
			if not 已经不满足 then
				满级 = 操作.识别(卡满级标识)
				if 满级.x>-1 then 已经不满足=true end
			end
			if not 已经不满足 then
				战斗中 = 操作.识别(卡战斗中标识)
				if 战斗中.x>-1 then 已经不满足=true end
			end
			if not 已经不满足 then
				观战中 = 操作.识别(卡观战中标识)
				if 观战中.x>-1 then 已经不满足=true end
			end

			keepScreen(false)
			
			if 满级.x==-1 and 战斗中.x==-1 and 观战中.x==-1 and 白蛋.x==-1 and 红蛋.x==-1 and 蓝蛋.x==-1 and 改名式神.x==-1 then
				操作.滑动(狗粮[i].x+35,狗粮[i].y-67, tTarRegion[狗粮位].x,tTarRegion[狗粮位].y,200)
				换好狗粮=true
				break
			end
			
		end
		if 换好狗粮 then 
			mSleep(888)
			break 
		end
		操作.滑动(736,550,487,545,200)
		mSleep(888)
	end
	
end


--------------选稀有度界面--------------
选稀有度界面={选稀有度}

function 选稀有度界面.选稀有度()
	for i=1,5 do
		if 操作.识别2(标识.选稀有度界面) then
			break
		elseif i==5 then
			return 执行任务.重新识别()
		end
		mSleep(300*参数.延时倍数)
	end
	
	if 参数.狗粮稀有度=='N卡' then
		操作.点击按钮(按钮.选稀有度界面_N卡按钮)
		mSleep(888)
	elseif 参数.狗粮稀有度=='素材' then
		操作.点击按钮(按钮.选稀有度界面_素材按钮)
		mSleep(888)
	elseif 参数.狗粮稀有度=='R卡' then
		操作.点击按钮(按钮.选稀有度界面_R卡按钮)
		mSleep(888)
	end
end


