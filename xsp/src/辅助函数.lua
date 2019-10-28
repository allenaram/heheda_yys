--------操作函数--------
操作={}
function 操作.点击(p,dx,dy)
	local dx = dx or 0
	local dy = dy or 0
	holdtime=100
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	p.x = p.x + math.random(0,dx)
	p.y = p.y + math.random(0,dy)
	touchDown(1, p.x, p.y)
	holdtime=math.random(60,80)
	if 参数.可视点击 then
		local finger = createHUD()
		showHUD(finger,"",30,"0x00ff0000","icons/tap.png",0,p.x-27,p.y-15,80,96)
		setTimer(holdtime+20,hideHUD,finger)
	end
	mSleep(holdtime)
	touchUp(1, p.x, p.y)
	mSleep(20)
end

function 操作.点击按钮(button) --(x1,y1)按钮左上角，(x2,y2)按钮右下角
	操作.点击({x=button.x1,y=button.y1},button.x2-button.x1,button.y2-button.y1)
end

function 操作.滑动(x1,y1,x2,y2,T,ddx1,ddy1,ddx2,ddy2)
	T=T or 50
	ddx1 = ddx1 or 0
	ddy1 = ddy1 or 0
	ddx2 = ddx2 or 0
	ddy2 = ddy2 or 0
	wave = 5
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	x1 = x1 + math.random(-ddx1,ddx1)
	y1 = y1 + math.random(-ddy1,ddy1)
	x2 = x2 + math.random(-ddx2,ddx2)
	y2 = y2 + math.random(-ddy2,ddy2)
    local dt = 25
	local times = T/dt
    local stepx, stepy = math.ceil(math.abs(x2-x1)/times), math.ceil(math.abs(y2-y1)/times)
	local x, y = x1, y1 
	
	touchDown(1, x, y)
	if 参数.可视点击 then
		finger = createHUD()
		showHUD(finger,"",30,"0x00ff0000","icons/tap.png",0,x-27,y-15,80,96)

	end
	
    local function move(from, to ,step) --坐标移动方向
      if from > to then
        do 
          return -1 * step 
        end
      else 
        return step 
      end 
    end
	
	local dx=0
	local dy=0
	local x_reached=false
	local y_reached=false
	local last_stepx=stepx
	local last_stepy=stepy
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    while not(x_reached) or not(y_reached) do
		--sysLog(string.format('%d,%d',last_stepx,last_stepy))
        if math.abs(x-x2) >= stepx and stepx>1 then
			if last_stepx <= stepx then
				dx = math.random(0,last_stepx/4+1) + last_stepx
			else
				dx = math.random(-last_stepx/4-1,0) + last_stepx
			end
			x = x + move(x,x2,dx)
			last_stepx = dx
		else --如果x坐标先到达，则让其在目标附近徘徊
			if not(x_reached) then x_reached=true end
			x = math.random(-wave,wave) + x2
		end
		
        if math.abs(y-y2) >= stepy and stepy>1 then
			if last_stepy <= stepy then
				dy = math.random(0,last_stepy/4+1) + last_stepy
			else
				dy = math.random(-last_stepy/4-1,0) + last_stepy
			end
			y = y + move(y,y2,dy)
			last_stepy = dy
		else
			if not(y_reached) then y_reached=true end
			y = math.random(-wave,wave) + y2
		end
        touchMove(1, x, y)
		--sysLog(string.format('%d,%d',x,y))
		if 参数.可视点击 then
			showHUD(finger,"",30,"0x00ff0000","icons/tap.png",0,x-27,y-15,80,96)
		end
        mSleep(dt/2)  --理论上应为dt，但考虑到运算本身的延时，故采用dt/2
    end
	touchMove(1, x, y)
	if 参数.可视点击 then
		showHUD(finger,"",30,"0x00ff0000","icons/tap.png",0,x-27,y-15,80,96)
	end
    mSleep(80)
    touchUp(1, x, y)
	if 参数.可视点击 then
		hideHUD(finger)
	end
end

function 操作.识别(colortable)
	local 识别对象={x=-1,y=-1}
	识别对象.x,识别对象.y=findMultiColorInRegionFuzzy(colortable[1],colortable[2],colortable[3],colortable[4],colortable[5],colortable[6],colortable[7])
	return 识别对象
end

function 操作.识别2(colortable) --return true or false
	local 识别对象={x=-1,y=-1}
	识别对象.x,识别对象.y=findMultiColorInRegionFuzzy(colortable[1],colortable[2],colortable[3],colortable[4],colortable[5],colortable[6],colortable[7])
	if 识别对象.x==-1 then 
		return false
	else
		return true
	end
end

function 操作.识别点击(colortable,not_click_allowed,dx,dy,mx,my,click_twice) -- click and return true, or return false, or 重新识别, up to para2
	not_click_allowed = not_click_allowed
	if not_click_allowed==nil then
		not_click_allowed=true
	end
	click_twice=click_twice
	if click_twice==nil then
		click_twice=false
	end
	dx = dx or 0
	dy = dy or 0
	mx = mx or 0
	my = my or 0
	local 识别对象={x=-1,y=-1}
	识别对象 = 操作.识别(colortable)
	if 识别对象.x==-1 then
		if not_click_allowed then
			return false
		else
			return 执行任务.重新识别()
		end
	end
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	识别对象.x = 识别对象.x + mx + math.random(-dx,-dx)
	识别对象.y = 识别对象.y + my + math.random(-dy,-dy)
	操作.点击(识别对象)
	if click_twice then
		mSleep(300)
		操作.点击(识别对象)
	end
	return true
end

function 操作.与识别(colortable_group,hold_screen) -- return true or false
	hold_screen = hold_screen or true
	if hold_screen then
		keepScreen(true)
	end
	for i=1,#colortable_group do
		local colortable=colortable_group[i]
		local 识别对象={x=-1,y=-1}
		识别对象 = 操作.识别(colortable)
		if 识别对象.x==-1 then
			if hold_screen then
				keepScreen(false)
			end
			return false
		end
	end
	if hold_screen then
		keepScreen(false)
	end
	return true
end

function 操作.与识别点击(colortable_group,click_index,dx,dy,mx,my) -- click and return true,or 重新识别
	dx = dx or 0
	dy = dy or 0
	mx = mx or 0
	my = my or 0
	local 点击对象={x=-1,y=-1}
	keepScreen(true)
	for i=1,#colortable_group do
		local colortable=colortable_group[i]
		local 识别对象={x=-1,y=-1}
		识别对象 = 操作.识别(colortable)
		if 识别对象.x==-1 then
			keepScreen(false)
			return 执行任务.重新识别()
		end
		if i==click_index then
			点击对象=识别对象
		end
	end
	keepScreen(false)
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	点击对象.x = 点击对象.x + mx + math.random(-dx,dx)
	点击对象.y = 点击对象.y + my + math.random(-dy,dy)
	操作.点击(点击对象)
	return true
end

function 操作.或识别(colortable_group,hold_screen) -- return true or false
	if nil == hold_screen then
		hold_screen = true
	end
	if hold_screen then
		keepScreen(true)
	end
	for i=1,#colortable_group do
		local colortable=colortable_group[i]
		local 识别对象={x=-1,y=-1}
		识别对象 = 操作.识别(colortable)
		if 识别对象.x>-1 then
			if hold_screen then
				keepScreen(false)
			end
			return true
		end
	end
	if hold_screen then
		keepScreen(false)
	end
	return false
end

function 操作.或识别点击(colortable_group,not_click_allowed,dx,dy,mx,my,hold_screen) -- click and return true,or 重新识别
	not_click_allowed = not_click_allowed
	if not_click_allowed==nil then
		not_click_allowed=true
	end
	dx = dx or 0
	dy = dy or 0
	mx = mx or 0
	my = my or 0
	if hold_screen == nil then 
		hold_screen = true
	end
	if hold_screen then
		keepScreen(true)
	end
	for i=1,#colortable_group do
		local colortable=colortable_group[i]
		local 识别对象={x=-1,y=-1}
		识别对象 = 操作.识别(colortable)
		if 识别对象.x>-1 then
			if hold_screen then
				keepScreen(false)
			end
			识别对象.x = 识别对象.x + mx + math.random(-dx,dx)
			识别对象.y = 识别对象.y + my + math.random(-dy,dy)
			操作.点击(识别对象)
			return true
		end
	end
	if hold_screen then
		keepScreen(false)
	end
		return false
end

function 操作.全识别(colortable)
	local 识别对象table=findMultiColorInRegionFuzzyExt(colortable[1],colortable[2],colortable[3],colortable[4],colortable[5],colortable[6],colortable[7])
	return 识别对象table
end

function 操作.找图(colortable)
	local 识别对象={x=-1,y=-1}
	识别对象.x,识别对象.y=findImageInRegionFuzzy(colortable[1],colortable[2],colortable[3],colortable[4],colortable[5],colortable[6],colortable[7])
	return 识别对象
end

function 操作.字符识别(rect, diff, whitelist, ocrConfig, ocr)
	--@para ocr: if given, new ocr willnot be created.
	whitelist = whitelist or "0123456789"
	ocrConfig = ocrConfig or {type = "tesseract"}
	local releaseOcr = not ocr
	ocr = ocr or createOCR(ocrConfig)
	local colorTbl = binarizeImage({
		rect = rect,
		diff = diff
	})
	local code, text = ocr:getText({
		data=colorTbl,
		whitelist = whitelist
	})
	if releaseOcr then
		ocr:release()
	end
	return trim(text)
end

function trim(s)
	if s~=nil then
		return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
	end
end

function LuaRemove(str,what2remove)  
	local lcSubStrTab = {}  
	while true do  
		local lcPos = string.find(str,what2remove)  
		if not lcPos then  
			lcSubStrTab[#lcSubStrTab+1] =  str      
			break  
		end  
		local lcSubStr  = string.sub(str,1,lcPos-1)  
		lcSubStrTab[#lcSubStrTab+1] = lcSubStr  
		str = string.sub(str,lcPos+1,#str)  
	end  
	local lcMergeStr =""  
	local lci = 1  
	while true do  
		if lcSubStrTab[lci] then  
			lcMergeStr = lcMergeStr .. lcSubStrTab[lci]   
			lci = lci + 1  
		else   
			break  
		end  
	end  
	return lcMergeStr  
end

function Split(str, delim, maxNb)   
    -- Eliminate bad cases...   
    if string.find(str, delim) == nil then  
        return { str }  
    end  
    if maxNb == nil or maxNb < 1 then  
        maxNb = 0    -- No limit   
    end  
    local result = {}  
    local pat = "(.-)" .. delim .. "()"   
    local nb = 0  
    local lastPos   
    for part, pos in string.gfind(str, pat) do  
        nb = nb + 1  
        result[nb] = part   
        lastPos = pos   
        if nb == maxNb then break end  
    end  
    -- Handle the last field   
    if nb ~= maxNb then  
        result[nb + 1] = string.sub(str, lastPos)   
    end  
    return result   
end  

function sysLog(str)
  if 参数.提示信息 then
		local hudw= 参数.设备宽/4
		local hudh = hudw/12
		resetScreenScale()
		showHUD(myhud,str,参数.设备高/30,"0xffffffff","icons/infobg.png",0, 3*hudh,hudh,hudw,2*hudh)     --变更显示的HUD内容
		setScreenScale(640,1136)    
	end
end

function syslog2(str)
	toast(str)
end

function syslog3(str)
	local myhud2=createHUD()
	hudw = 参数.设备宽/5
	hudh = hudw/10
	for i=1 ,8,1 do
		name = "launch"
		if i< 10 then
			name ="icons/infobg2_000"..i..".png"
		else
			name ="icons/infobg2_00"..i..".png"
		end
		showHUD(myhud2,str,参数.设备高/30,"0xffffffff",name,1, 0,7*hudh,1.3*hudw,3*hudh)
		mSleep(40)
	end
	
	local function hide()
		for i=8 ,1,-1 do
			name = "launch"
			if i< 10 then
				name ="icons/infobg2_000"..i..".png"
			else
				name ="icons/infobg2_00"..i..".png"
			end
			showHUD(myhud2,str,参数.设备高/30,"0xffffffff",name,1, 0,7*hudh,1.3*hudw,3*hudh)
			mSleep(10)
		end		
		hideHUD(myhud2)
		myhud2=nil
	end
	
	setTimer(3000,hide)
	
end

function launchLua()
	for i=0 ,5,1 do
		if i%2 == 1 then 
			showMyHUD("")
		else
			showMyHUD("···脚本启动中···")
		end
		mSleep(300)
	end
	showMyHUD("")
	hud =  createHUD()
	for i=1 ,8,1 do
		name = "launch"
		if i< 10 then
			name ="launch_000"..i.."_"..i..".png"
		else
			name ="launch_00"..i.."_"..i..".png"
		end
		showHUD(hud,"",参数.设备高/40,"0xfff62f2a",name,0, 0,0,参数.设备宽,参数.设备高) 
		--showHUD(hud,"",参数.设备高/30,"0xffffffff",name,0, 2*hudh,hudh,hudw,2*hudh)
		mSleep(10)
	end
	
  mSleep(500)
  hideHUD(hud)
end

function showMyHUD(str)
	hudw= 参数.设备宽/5
	hudh = hudw/10
	if _G["visibleTip"] =="0" then
		showHUD(myhud,str,h/40,"0xff75bd21","0x88000000",0, 40,h-hudh,hudw,hudh)     --变更显示的HUD内容
	end
end
----


