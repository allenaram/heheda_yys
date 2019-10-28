-------------协作任务界面-------------
协作任务界面={}

function 协作任务界面.处理()
	local 接受=false
	if 参数.接受协作 then
		if 参数.协作表.排骨 and 操作.识别2(标识.协作界面_排骨) then
			接受=true
		elseif 参数.协作表.鲜鱼 and 操作.识别2(标识.协作界面_鲜鱼) then
			接受=true
		elseif 参数.协作表.勾协 and 操作.识别2(标识.协作界面_勾协) then
			接受=true
		elseif 参数.协作表.体协 and 操作.识别2(标识.协作界面_体协) then
			接受=true
		else
			local ocr, msg = createOCR({type = "tesseract", })	
			local colorTbl = binarizeImage({
				rect = {588,449,600,466},
				diff = {"0xffffff-0x2f2f2f"}
			})
			local code, text = ocr:getText({
				data=colorTbl,
				whitelist = "123" 
			})
			
			sysLog(trim(text))
			if 参数.协作表.三万 and trim(text)=='3' then
				接受=true
			elseif 参数.协作表.两万 and trim(text)=='2' then
				接受=true
			elseif 参数.协作表.一万 and trim(text)=='1' then
				接受=true
			end
			ocr:release()
		end
		
	end
	if 接受 then
		操作.点击按钮(按钮.协作界面_接受按钮)
	else 
		操作.点击按钮(按钮.协作界面_拒绝按钮)
	end
	mSleep(888)
	return 执行任务.重新识别()
end

--[[
function 协作任务界面.处理()
	sysLog('收到协作任务！')
	if 参数.接受协作 then
		mSleep(200)
		local 接受={x=-1,y=-1}
		接受 = 操作.识别(按钮.协作任界面_接受按钮)
		if 接受.x>-1 then
			操作.点击(接受)
		end
		return 执行任务.重新识别()
	else
		mSleep(200)
		local 拒绝={x=-1,y=-1}
		拒绝 = 操作.识别(按钮.协作任务界面_拒绝按钮)
		if 拒绝.x>-1 then
			操作.点击(拒绝)
		end
		return 执行任务.重新识别()
	end
end
--]]