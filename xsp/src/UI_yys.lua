local ui = require "G_ui"

function 生成界面()
	ui:new(参数.设备宽,参数.设备高,'启动脚本','退出脚本','hhd_yys_ui')
	
	local p=ui:newPage('选择任务')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"选择服务器",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,2,'服务器',30,nil,'0,0,255')
	p:addRadioBoxGroup(8,1.5,'服务器','0','正式服','体验服')	
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"选择任务",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,2,'主任务',30,nil,'0,0,255')
	p:addRadioBoxGroup(8,4,'选择任务','0','探索','御魂','觉醒','突破','御灵','妖气','狗粮升星','抽厕纸','超鬼王')	
	p:newLine()
	p:addLebel(1.5,1,'副任务',30,nil,'0,0,255')
	p:addCheckBoxGroup(10,1,'穿插任务',nil,'穿插个人突破','穿插寮突破','穿插年兽','穿插死神')
	p:addLebel(9.5,1,'说明1',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'智能开关',30,nil,'0,0,255')
	p:addCheckBoxGroup(10,1,'开关buff表',nil,'觉醒buff','御魂buff','金币buff','经验buff')
	p:newLine()
	p:addLebel(1.5,1,'接受协作',30,nil,'0,0,255')
	p:addCheckBoxGroup(8,2,'接受协作',nil,'勾协','体协','三万','两万','一万','排骨','鲜鱼')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"其他设置",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'可视化',30,nil,'0,0,255')
	p:addCheckBoxGroup(8,1,'可视化','0@1','可视点击','提示信息')
	p:newLine()
	p:addLebel(1.5,1,'重连设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,1,'重连',nil,'闪退重连','禁止切出游戏')
	p:addLebel(9.5,1,'说明3',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'自动战斗',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,1,'自动战斗',nil,'自动战斗技能可选','自动、手动检测')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addLebel(10,1,'(【自动、手动检测】功能稳定性有待测试，除非经常卡在手动模式，否则不建议勾选)',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'体力用完',30,nil,'0,0,255')
	p:addRadioBoxGroup(8,1,'体力用完','0','关闭Buff并结束主任务','自动购买体力')
	p:newLine()
	p:addLebel(1.5,1,'队友未响应',30,nil,'0,0,255')
	p:addRadioBoxGroup(7,1,'队友未响应','1','关闭Buff并结束主任务','继续等待')
	p:addLebel(9.5,1,'说明2',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'禁止聊天',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,1,'禁止聊天','0','强制关闭频道和私信')
	p:newLine()
	p:addLebel(1.5,1,' ',30,nil,'0,0,255')
	p:addLebel(10,1,'(强烈建议勾选，以防误点卡住)',25,nil,'255,0,0')
	p:newLine(1)
	p:addLebel(1.5,1,'延时倍数',30,nil,'0,0,255')
	p:addComboBox(1.5,1,'延时倍数','0','1倍','1.5倍','2倍','2.5倍')
	p:addLebel(9.5,1,'说明4',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'满级识别度',30,nil,'0,0,255')
	p:addComboBox(1.5,1,'满级识别度','5','60','61','62','63','64','65','66','67','68','69','70')
	p:addLebel(9.5,1,'说明5',25,nil,'255,0,0')
	p:newLine(0.7)
	p:addLebel(9.5,1,'===说明===',30,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'1.关于【主任务】和【副任务】：如果希望A任务与突破穿插执行，则在主任务中勾选A任务，在副任务中勾选“穿插进行寮突破”或“穿插进行个人突破”，然后去主任务对应的页面设置主任务参数，最后在突破页面设置副任务参数。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'2.若选择“关闭Buff并结束主任务”，则队员与队长均会在等待3分钟左右后关闭Buff并结束主任务(若无副任务则关闭脚本)，防止组队的一方掉线，另一方浪费Buff。等待时间设置为3分钟是允许掉线的一方重连，低性能设备等待时间可能大于3分钟。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,1.5,'3.免root用户请勿勾选此项，以防脚本无法正常运行。其余用户推荐勾选。如出现无法正常运行，也请取消勾选。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'4.【延时倍数】越大，游戏运行越流畅，手机耗电发热越小，但可能导致界面切换时脚本反应变慢。越狱用户无需设置，选择默认的“1倍”即可；免越狱、低配手机用户根据实际情况调整。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,3,'5.有用户反映狗粮没满级也会切换到换狗粮界面，或偶有换下未满级狗粮的情况，因此增加了【狗粮识别度】的可调节项，过大的识别度可能导致识别不到狗粮满级，而过小的识别度则可能出现没满级就换的情况，默认65为作者测试后认为最佳的值，若用户换狗粮时仍有异常，请自行调节此参数，并反馈给作者。',25,nil,'255,0,0')
	
	------ 常规任务 ------
	p=ui:newPage('探索设置')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"探索副本",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(10,1,'(击杀BOSS后小纸人即使不点奖励也会到账。为提高效率，呵呵哒不会点击，望周知。)',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'探索方式',30,nil,'0,0,255')
	p:addComboBox(1.8,1,'探索组队类型','0','单人','队长','队员')
	p:newLine(0.5)
	p:addLebel(10,1,'----------------队长设置----------------',30,nil,'0,0,255')
	p:newLine()
	p:addLebel(1.5,1,'选择章节',30,nil,'0,0,255')
	p:addComboBox(2.5,1,'探索章节','27','第一章','第二章','第三章','第四章','第五章','第六章','第七章','第八章','第九章','第十章','第十一章','第十二章','第十三章','第十四章','第十五章','第十六章','第十七章','第十八章','第十九章','第二十章','第二十一章','第二十二章','第二十三章','第二十四章','第二十五章','第二十六章','第二十七章','第二十八章','最新章节')
	p:addRadioBoxGroup(6,1,'探索难度','1','普通','困难')
	p:newLine()
	p:addLebel(1.5,1,'章节识别',30,nil,'0,0,255')
	p:addRadioBoxGroup(6,1,'探索选关模式','0','快速识别','精准识别')
	p:addLebel(5,1,'说明1',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'选择目标',30,nil,'0,0,255')
	p:addCheckBoxGroup(8,1,'选择怪物','0@3','经验怪','金币怪','御魂怪','打BOSS')
	p:newLine()
	p:addLebel(1.5,1,'邀请目标',30,nil,'0,0,255')
	p:addComboBox(2,1,'探索邀请目标','1','固定队友','好友','寮友','跨区')
	p:addCheckBoxGroup(3,1,'探索重设固定队友',nil,'重设固定队友')
	p:newLine()
	p:addLebel(10,1,'----------------队员设置----------------',30,nil,'0,0,255')
	p:newLine()
	p:addLebel(1.5,1,'发现宝物',30,nil,'0,0,255')
	p:addRadioBoxGroup(10,1,'探索发现','0','优先接受邀请','优先处理探索发现')
	p:newLine()
	p:addLebel(10,1,'(若选择“优先处理探索发现”，可能会拒绝队长的第一次邀请以识别是否有探索宝箱等。)',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(10,1,'-----------------------------------------',30,nil,'0,0,255')
	p:newLine()
	p:addLebel(1.5,1,'标记设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(1.5,1,'探索点怪',nil,'点怪')
	p:addRadioBoxGroup(8,1,'探索集火目标','0','小怪','大怪')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addCheckBoxGroup(2.5,1,'探索是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'探索标记己方','0','左前','中前','右前','左后','右后')
	p:newLine()
	p:addLebel(1.5,1,'狗粮设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,1,'狗粮设置','0@1','换狗粮','狗粮普攻')
	p:newLine()
	p:addLebel(1.5,1,'狗粮位置',30,nil,'0,0,255')
	b=p:newBox(3.7,1.5)
	b:addCheckBoxGroup(5,1,'前排式神','0@2','左前','中前','右前')
	b:addLebel(5,1,'说明2',25,nil,'255,0,0')
	b:newLine()
	b:addCheckBoxGroup(1.4,1,'左后式神','0','左后')
	b:addLebel(1,1,'阴阳师',30,'nil','nil','255,255,0')
	b:addCheckBoxGroup(1.4,1,'右后式神','','右后')
	p:newLine()
	p:addLebel(1.7,1,'狗粮预翻页',30,nil,'0,0,255')
	p:addComboBox(1.5,1,'狗粮预翻页','0','0','5','10','15','20','30','40','50','60','80','100')
	p:addLebel(1,1,'%',30)
	p:addLebel(5,1,'说明3',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'狗粮筛选',30,nil,'0,0,255')
	b=p:newBox(2,1)
	b:addRadioBoxGroup(4,1,'狗粮稀有度','0','N卡','素材')
	b:addLebel(5,1,'说明4',25,nil,'255,0,0')
	b:newLine()
	b:addCheckBoxGroup(8,2.3,'狗粮类型','0@3','不上改名式神','不上白蛋','不上红蛋','不上蓝蛋','只上改名式神','只上白蛋')
	p:newLine()
	p:newLine()
	p:addLebel(9.5,1,'===说明===',30,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'1.正常情况下默认“快速识别”即可，若出现反复拖动章节列表不选章节（多出现在前几章），请切换为“精准识别”，但会增加识别时间。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'2.勾选“换狗粮”或“狗粮普攻”后，请务必在【狗粮位置】中的队形示意图中标明你的狗粮位置。组队模式下队员勾选前排，队长勾选后排；单人模式则只需要勾选前排。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'3.【狗粮预翻页】会在正常翻页前拖动页数条，直接跳过一部分不想练的狗粮。例如有100页狗粮，预翻页选择50%，则会直接跳过前50页。预翻页推荐用于组队探索，以免更换不及。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'4.小技巧：在【狗粮筛选】中勾选“不上改名式神”，事先给不想练的狗粮（如五星白蛋等）重命名，即可跳过它们。',25,nil,'255,0,0')
	
	p=ui:newPage('御魂设置')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"御魂副本",40,nil,'255,255,255')
	p:newLine()
	p:addRadioBoxGroup(8,1,'御魂选择BOSS','0','八歧大蛇','业原火','卑弥呼')
	p:newLine()
	p:addLebel(9.5,2,'先选择副本，再下拉完成对应副本设置。\n换狗粮功能各任务共享。',25,nil,'255,0,0')
	p:newLine()
	
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(7,2,"大蛇设置",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'选择层数',30,nil,'0,0,255')
	p:addComboBox(1.8,1,'御魂层数','9','一层','二层','三层','四层','五层','六层','七层','八层','九层','十层','悲鸣')
	p:addCheckBoxGroup(3,1,'御魂使用默认层数',nil,'默认当前层数')
	p:addLebel(5,1,'说明1',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'组队方式',30,nil,'0,0,255')
	p:addComboBox(1.8,1,'御魂组队方式','1','单人','3人队长','2人队长','队员')
	p:newLine()
	p:addLebel(1.5,1,'集火设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(1.5,1,'御魂是否点怪',nil,'点怪')
	b=p:newBox(3.7,2)
	b:addLebel(1,1,'一回目',28)
	b:addComboBox(1.2,1,'御魂点怪一回目','2','左','中','右')
	b:addLebel(5,1,'说明2',25,nil,'255,0,0')
	b:newLine()
	b:addLebel(1,1,'二回目',28)
	b:addComboBox(1.2,1,'御魂点怪二回目','2','左','中','右')
	b:newLine()
	b:addLebel(1,1,'三回目',28)
	b:addComboBox(1.2,1,'御魂点怪三回目','2','左','中','右')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addCheckBoxGroup(2.5,1,'大蛇是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'大蛇标记己方','0','1号位','2号位','3号位','4号位','5号位')
	p:newLine()
	--p:addLebel(10,1,'--------------------组队设置---------------------',30,nil,'0,0,255')
	--p:newLine()
	p:addLebel(1.5,1,'队长设置',30,nil,'0,0,255')
	p:addLebel(1.5,1,'建房类型：',28,nil,'0,0,0')
	p:addComboBox(1.8,1,'御魂队伍类型','0','所有人','仅好友','不公开')
	p:newLine()
	p:addLebel(1.5,1,'      ',30,nil,'0,0,255')
	p:addCheckBoxGroup(1.5,1,'御魂是否邀请',nil,'邀请')
	p:addComboBox(1.5,1,'御魂邀请人数','0','1个','2个')
	p:addComboBox(1.8,1,'御魂邀请目标','1','固定队友','好友','最近','跨区')
	p:addCheckBoxGroup(3,1,'御魂重设固定队友',nil,'重设固定队友')
	p:newLine()
	p:addLebel(1.5,1,'      ',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,1,'御魂重邀',nil,'失败重邀','默认邀请队友')
	p:newLine()
	p:addLebel(1.5,1,'队员设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(10,1,'御魂自动接受',0,'自动接受邀请')
	p:newLine(1)
	
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(7,2,"业原火设置",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'选择目标',30,nil,'0,0,255')
	p:addComboBox(1.8,1,'业原火层数','2','贪','嗔','痴')
	p:addCheckBoxGroup(3,1,'业原火_使用默认层数','0','默认当前层数')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addLebel(9.5,1,'此处疑似有脚本检测，强烈建议勾选【默认当前层数】。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'集火设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(1.5,1,'业原火是否点怪',nil,'点怪')
	b=p:newBox(3.7,2)
	b:addLebel(1,1,'一回目',28)
	b:addComboBox(1.2,1,'业原火点怪一回目','2','前排左','前排中','前排右','后排左','后排中','后排右')
	b:addLebel(5,1,'说明2',25,nil,'255,0,0')
	b:newLine()
	b:addLebel(1,1,'二回目',28)
	b:addComboBox(1.2,1,'业原火点怪二回目','2','前排左','前排中','前排右','后排左','后排中','后排右')
	b:newLine()
	b:addLebel(1,1,'三回目',28)
	b:addComboBox(1.2,1,'业原火点怪三回目','2','左','中','右')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addCheckBoxGroup(2.5,1,'业原火是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'业原火标记己方','0','1号位','2号位','3号位','4号位','5号位')
	p:newLine(1)
	
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(7,2,"卑弥呼设置",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'选择层数',30,nil,'0,0,255')
	p:addComboBox(1.8,1,'卑弥呼层数','2','一层','二层','三层')
	p:addCheckBoxGroup(3,1,'卑弥呼使用默认层数',nil,'默认当前层数')
	p:newLine()
	p:addLebel(1.5,1,'组队方式',30,nil,'0,0,255')
	p:addComboBox(1.8,1,'卑弥呼组队方式','1','单人','3人队长','2人队长','队员')
	p:newLine()
	p:addLebel(1.5,1,'集火设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(2,1,'卑弥呼是否点怪',nil,'点怪')
	p:addComboBox(2,1,'卑弥呼集火目标','3','左','右','Boss','Boss及草人')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addCheckBoxGroup(2,1,'卑弥呼是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'卑弥呼标记己方','0','1号位','2号位','3号位','4号位','5号位')
	--p:newLine()
	--p:addLebel(10,1,'--------------------组队设置---------------------',30,nil,'0,0,255')
	p:newLine()
	p:addLebel(1.5,1,'队长设置',30,nil,'0,0,255')
	p:addLebel(1.5,1,'建房类型：',28,nil,'0,0,0')
	p:addComboBox(1.8,1,'卑弥呼队伍类型','0','所有人','仅好友','不公开')
	p:newLine()
	p:addLebel(1.5,1,'      ',30,nil,'0,0,255')
	p:addCheckBoxGroup(1.5,1,'卑弥呼是否邀请',nil,'邀请')
	p:addComboBox(1.5,1,'卑弥呼邀请人数','0','1个','2个')
	p:addComboBox(1.8,1,'卑弥呼邀请目标','1','固定队友','好友','最近','跨区')
	p:addCheckBoxGroup(3,1,'卑弥呼重设固定队友',nil,'重设固定队友')
	p:newLine()
	p:addLebel(1.5,1,'      ',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,1,'卑弥呼重邀',nil,'失败重邀','默认邀请队友')
	p:newLine()
	p:addLebel(1.5,1,'队员设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(10,1,'卑弥呼自动接受',0,'自动接受邀请')
	p:newLine(1)
	
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(7,2,"换狗粮",40,nil,'255,255,255')
	p:newLine()
	p:addCheckBoxGroup(6,1,'御魂换狗粮',nil,'换狗粮')
	p:addLebel(5,1,'说明3',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'狗粮位置',30,nil,'0,0,255')
	b=p:newBox(3.7,1.5)
	b:addCheckBoxGroup(8,1,'御魂狗粮位',nil,'左一','左二','中间','右二','右一')
	b:newLine()
	b:addLebel(2,1,'      ',30,nil,'0,0,255')
	b:addLebel(1,1,'阴阳师',30,'nil','nil','255,255,0')
	p:newLine()
	p:addLebel(1.7,1,'狗粮预翻页',30,nil,'0,0,255')
	p:addComboBox(1.5,1,'御魂狗粮预翻页','0','0','5','10','15','20','30','40','50','60','80','100')
	p:addLebel(1,1,'%',30)
	p:newLine()
	p:addLebel(1.5,1,'狗粮筛选',30,nil,'0,0,255')
	b=p:newBox(2,1)
	b:addRadioBoxGroup(4,1,'御魂狗粮稀有度','0','N卡','素材')
	b:newLine()
	b:addCheckBoxGroup(8,2.3,'御魂狗粮类型','0@3','不上改名式神','不上白蛋','不上红蛋','不上蓝蛋','只上改名式神','只上白蛋')
	p:newLine(1)
	p:addLebel(10,1,'--------------------------------------------------',30,nil,'0,0,255')
	p:newLine(1)
	p:addLebel(9.5,1,'===说明===',30,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'1.部分设备可能出现层数无法识别或识别错误的情况，此时可手动选好层数，然后勾选“默认当前层数”，勾选后呵呵哒不会再主动选择层数。觉醒任务同理。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'2.点怪功能可以不用尽量不用，因为识别回目数会使战斗中识别频率翻倍，这与呵呵哒“高效”的理念有悖。不过作者很自信的说，即使勾选，呵呵哒的效率仍然比别的脚本高。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'3.推荐使用换狗粮功能的用户取消勾选“默认邀请队友”和“默认接受邀请”，可减少设备功耗。若出现不识别满级狗粮的情况，请务必取消勾选。',25,nil,'255,0,0')
	p:newLine()

	p=ui:newPage('觉醒设置')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"觉醒材料",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'选择目标',30,nil,'0,0,255')
	p:addRadioBoxGroup(10,1,'麒麟属性','3','火麒麟','风麒麟','水麒麟','雷麒麟')
	p:newLine()
	p:addLebel(1.5,1,'选择层数',30,nil,'0,0,255')
	p:addComboBox(1.8,1,'觉醒层数','9','一层','二层','三层','四层','五层','六层','七层','八层','九层','十层')
	p:addCheckBoxGroup(3,1,'觉醒使用默认层数',nil,'默认当前层数')
	p:newLine()
	p:addLebel(1.5,1,'组队方式',30,nil,'0,0,255')
	p:addComboBox(1.8,1,'觉醒组队方式','1','单人','3人队长','2人队长','队员')
	p:newLine()
	p:addLebel(1.5,1,'集火设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(1.5,1,'觉醒点怪',nil,'点怪')
	p:addRadioBoxGroup(8,1,'觉醒集火目标','0','小怪','大怪')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addCheckBoxGroup(2.5,1,'觉醒是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'觉醒标记己方','0','左前','中前','右前','左后','右后')
	p:newLine()
	--p:addLebel(10,1,'--------------------组队设置---------------------',30,nil,'0,0,255')
	--p:newLine()
	p:addLebel(1.5,1,'队长设置',30,nil,'0,0,255')
	p:addLebel(1.5,1,'建房类型：',28,nil,'0,0,0')
	p:addComboBox(1.8,1,'觉醒队伍类型','0','所有人','仅好友','不公开')
	p:newLine()
	p:addLebel(1.5,1,'        ',30,nil,'0,0,255')
	p:addCheckBoxGroup(1.5,1,'觉醒是否邀请',nil,'邀请')
	p:addComboBox(1.5,1,'觉醒邀请人数','0','1个','2个')
	p:addComboBox(1.8,1,'觉醒邀请目标','1','固定队友','好友','最近','跨区')
	p:addCheckBoxGroup(3,1,'觉醒重设固定队友',nil,'重设固定队友')
	p:newLine()
	p:addLebel(1.5,1,'        ',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,1,'觉醒重邀',nil,'失败重邀','默认邀请队友')
	p:newLine()
	p:addLebel(1.5,1,'队员设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(10,1,'觉醒自动接受',0,'自动接受邀请')
	p:newLine()
	p:addLebel(10,1,'--------------------------------------------------',30,nil,'0,0,255')
	
	p=ui:newPage('突破设置')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"突破任务",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'选择任务',30,nil,'0,0,255')
	p:addRadioBoxGroup(8,1,'突破方式','1','个人突破','寮突破')
	p:newLine()
	local b=p:newBox(0.3,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"个人突破设置",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'刷新方式',30,nil,'0,0,255')
	p:addComboBox(2,1,'个人突破刷新方式','2','三胜刷新','六胜刷新','突破全部')
	p:newLine()
	p:addLebel(1.5,1,'突破目标',30,nil,'0,0,255')
	p:addLebel(1.2,1,'最高突破',28)
	p:addComboBox(1,1,'个人突破最高勋章','5','0','1','2','3','4','5')
	p:addLebel(2.5,1,'勋章目标，最低突破',28)
	p:addComboBox(1,1,'个人突破最低勋章','0','0','1','2','3','4','5')
	p:addLebel(1.2,1,'勋章目标',28)
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addLebel(1.2,1,'优先突破',28)
	p:addComboBox(2,1,'个人突破方向','0','勋章多的','勋章少的')
	p:newLine()
	p:addCheckBoxGroup(2.5,1,'个人突破是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'个人突破标记己方','0','1号位','2号位','3号位','4号位','5号位')
	p:newLine()
	p:addLebel(10,1,'---------------穿插个人突破设置---------------',30,nil,'0,0,255')
	p:newLine()
	p:addLebel(1.5,1,'穿插设置',30,nil,'0,0,255')
	p:addRadioBoxGroup(10,1,'个人突破穿插依据','0','挑战券满后切换','CD冷却后切换')
	p:newLine()
	p:addLebel(1.5,1,'设置CD',30,nil,'0,0,255')
	p:addComboBox(2,1,'个人突破间隔','4','5','10','20','30','60','90','120')
	p:addLebel(2,1,'分钟',28)
	p:addLebel(9.5,1,'说明2',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(10,1,'-----------------------------------------------',30,nil,'0,0,255')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"寮突破设置",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'突破目标',30,nil,'0,0,255')
	p:addLebel(1.2,1,'最高突破',28)
	p:addComboBox(1,1,'寮突破最高勋章','5','0','1','2','3','4','5')
	p:addLebel(2.5,1,'勋章目标，最低突破',28)
	p:addComboBox(1,1,'寮突破最低勋章','0','0','1','2','3','4','5')
	p:addLebel(1.2,1,'勋章目标',28)
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addLebel(1.2,1,'优先突破',28)
	p:addComboBox(2,1,'寮突破方向','0','勋章多的','勋章少的')
	p:newLine()
	p:addCheckBoxGroup(2.5,1,'寮突破是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'寮突破标记己方','0','1号位','2号位','3号位','4号位','5号位')
	p:newLine()
	p:addLebel(1.5,1,'设置CD',30,nil,'0,0,255')
	p:addComboBox(2,1,'寮突破间隔','4','5','10','20','30','60','90','120')
	p:addLebel(2,1,'分钟',28)
	p:newLine(2)
	p:addLebel(9.5,1,'===说明===',30,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,2,'1.【个人突破设置】中“突破目标”的优先级高于“刷新方式”，例如我刷新方式选择“突破全部”，最高突破4勋章的目标，此时已经击破8个目标，剩下一个5勋章的目标，呵呵哒会选择刷新，放弃“全部突破”。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(9.5,3,'2.关于穿插个人突破的切换方式，御魂单人、队长推荐“CD冷却后切换”，探索、御魂队员推荐“挑战券满后切换”。呵呵哒仅在回到探索地图时识别突破券的数量，因而对于御魂这类仅在翻车时会回到探索地图的任务，选择满券切换很可能导致突破券溢出。在【基本设置】页签勾选智能开关buff食用效果更加。',25,nil,'255,0,0')
	
	p=ui:newPage('御灵设置')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"御灵之境",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'御灵目标',30,nil,'0,0,255')
	p:addRadioBoxGroup(10,1,'御灵目标','3','神龙','白藏主','黑豹','孔雀')
	p:newLine()
	p:addLebel(1.5,1,'选择层数',30,nil,'0,0,255')
	p:addComboBox(1.8,1,'御灵层数','2','一层','二层','三层')
	p:addCheckBoxGroup(3,1,'御灵_使用默认层数','0','默认当前层数')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addLebel(9.5,1,'此处疑似有脚本检测，强烈建议勾选【默认当前层数】。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'标记',30,nil,'0,0,255')
	p:addCheckBoxGroup(3,1,'御灵点草人',nil,'标记草人')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addCheckBoxGroup(2.5,1,'御灵是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'御灵标记己方','2','1号位','2号位','3号位','4号位','5号位','左前','中前','右前','左后','右后')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addLebel(9.5,1,'孔雀本的己方站位与其他三个本不同，请区别选择。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addLebel(9.5,3,'推荐标记位：神龙白藏住黑豹3号位、孔雀中前。',25,nil,'255,0,0')
	p:newLine()
	
	p=ui:newPage('妖气设置')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"妖气封印",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'进房模式',30,nil,'0,0,255')
	p:addRadioBoxGroup(6,1,'妖气挤房模式','1','挤房','排队')
	p:newLine()
	p:addLebel(1.5,1,'选择目标',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,3.5,'妖气目标','0','日和坊','小松丸','鬼使黑','海坊主','跳跳哥哥','二口女','骨女','椒图','饿鬼')
	p:newLine()
	
	p=ui:newPage('年兽')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"穿插年兽",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'是否挤车',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,1,'年兽挤车',nil,'挤车')
	p:newLine()
	p:addLebel(1.5,1,'金币Buff',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,3.5,'交叉年兽开金币buff',nil,'挤车时开启','自己发现时开启')
	p:newLine()
	
	------ 辅助任务 ------
	p=ui:newPage('狗粮升星')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"狗粮升星",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(9.5,6,'1.使用本功能前，请将不想作为升星目标的卡都上锁，并确保有足够的升星目标和材料卡。\n\n2.请勾选【升星材料】选择允许作为材料的卡，默认满级的卡、黑蛋不作为材料。若有需要特殊保护的卡（例如19级的N卡）也请上锁。\n\n3.对于升星材料的选择方式，当材料非常多时建议勾选【按类别查找】；当高星材料非常多时（例如当前任务为2升3，但已有相当多未满级的三星材料）建议勾选【按星级查找】。\n\n4.使用【点击“继续升星”自动选择下一个】会由系统选择下一个升星目标和使用的材料，一般来说比较可靠，不放心可以选择【手动寻找下一个】。',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'升星目标',30,nil,'0,0,255')
	p:addRadioBoxGroup(8,1,'狗粮升星_目标','0','N卡','素材')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addComboBox(2,1,'狗粮升星_星级','0','2星升3星','3星升4星','4星升5星')
	p:newLine()
	p:addLebel(1.5,1,'升星次数',30,nil,'0,0,255')
	p:addEdit(1.5,1,'狗粮升星_次数','5')
	p:addLebel(1.5,1,'次',30,nil,'0,0,255')
	p:newLine()
	p:addLebel(1.5,1,'选择材料',30,nil,'0,0,255')
	p:addCheckBoxGroup(10,1,'狗粮升星_材料','0','N卡','红蛋','白蛋','蓝蛋')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addRadioBoxGroup(8,1,'狗粮升星_材料分类方式','0','按星级查找','按类别查找')
	p:newLine()
	p:addLebel(1.5,1,'选择下一个升星目标',30,nil,'0,0,255')
	p:addRadioBoxGroup(10,1,'狗粮升星_选择下一个升星目标',0,'手动寻找下一个', '点击“继续升星”自动选择下一个')
	p:newLine()
	
	p=ui:newPage('抽厕纸')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"抽厕纸",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'抽卡次数',30,nil,'0,0,255')
	p:addEdit(1.5,1,'抽厕纸_数量','50')
	p:addLebel(1.5,1,'次',30,nil,'0,0,255')
	p:newLine()
	
	------ 活动任务 ------
	p=ui:newPage('轮回秘境')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"轮回秘境",40,nil,'255,255,255')
	p:newLine()
	p:addCheckBoxGroup(6,1,'轮回秘境_使用眼','0','使用轮回之眼')
	p:newLine()
	p:addLebel(1.5,1,'推图策略',30,nil,'0,0,255')
	p:addRadioBoxGroup(6,1,'轮回秘境_推图策略','0','尽快下一层','平推')
	p:newLine()
	p:addLebel(1.5,1,'掉落选择',30,nil,'0,0,255')
	p:addRadioBoxGroup(6,1,'轮回秘境_掉落选择','2','金币','经验','御魂','觉醒')
	p:newLine()
	p:addLebel(1.5,1,'第一优先',30,nil,'0,0,255')
	p:addComboBox(1.5,1,'轮回秘境_第一优先','0','轮回之眼','宝箱','时曲碎片','未翻格子','普通格子')
	p:newLine()
	p:addLebel(1.5,1,'第二优先',30,nil,'0,0,255')
	p:addComboBox(1.5,1,'轮回秘境_第二优先','1','轮回之眼','宝箱','时曲碎片','未翻格子','普通格子')
	p:newLine()
	p:addLebel(1.5,1,'第三优先',30,nil,'0,0,255')
	p:addComboBox(1.5,1,'轮回秘境_第三优先','2','轮回之眼','宝箱','时曲碎片','未翻格子','普通格子')
	p:newLine()
	p:addLebel(1.5,1,'第四优先',30,nil,'0,0,255')
	p:addComboBox(1.5,1,'轮回秘境_第四优先','3','轮回之眼','宝箱','时曲碎片','未翻格子','普通格子')
	p:newLine()
	p:addLebel(1.5,1,'第五优先',30,nil,'0,0,255')
	p:addComboBox(1.5,1,'轮回秘境_第五优先','4','轮回之眼','宝箱','时曲碎片','未翻格子','普通格子')
	p:newLine()
	p:addCheckBoxGroup(1.5,1,'轮回秘境_标记',nil,'点怪')
	p:addRadioBoxGroup(8,1,'轮回秘境_标记目标','1','小怪','大怪')
	p:newLine()
	p:addCheckBoxGroup(2.5,1,'轮回秘境_是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'轮回秘境_标记己方','0','1号位','2号位','3号位','4号位','5号位')
	p:newLine()
	
	p=ui:newPage('超鬼王')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"超鬼王",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'攻打目标',30,nil,'0,0,255')
	p:newLine()
	local b=p:newBox(0.5,4.5)
	b:addCheckBoxGroup(2.2,1,'攻打自己发现的超鬼王',0,'自己发现')
	b:addLebel(1,1,'最低打',28)
	b:addComboBox(1.5,1,'自己发现的超鬼王最低打几星','0','1','2','3','4','5','6')
	b:addLebel(1.3,1,'星, 最高打',28)
	b:addComboBox(1.5,1,'自己发现的超鬼王最高打几星','5','1','2','3','4','5','6')
	b:addLebel(0.5,1,'星',28)
	b:newLine()
	b:addLebel(2.2,1,'',28)
	b:addLebel(1,1,'血量≤',28)
	b:addComboBox(1.5,1,'自己发现的超鬼王攻打血线','0','0','10','20','30','40','50','60','70','80','90','99','100')
	b:addLebel(2,1,'% 停止攻打',28)
	b:newLine()
	b:addLebel(2.2,1,'',28)
	b:addCheckBoxGroup(4,1,'超鬼王结算完成后切换',nil,'结算完成后切换主任务')
	b:newLine()
	b:addCheckBoxGroup(2.2,1,'攻打好友邀请的超鬼王',nil,'好友邀请')
	b:addLebel(1,1,'最低打',28)
	b:addComboBox(1.5,1,'好友邀请的超鬼王最低打几星','0','1','2','3','4','5','6')
	b:addLebel(1.3,1,'星, 最高打',28)
	b:addComboBox(1.5,1,'好友邀请的超鬼王最高打几星','5','1','2','3','4','5','6')
	b:addLebel(0.5,1,'星',28)
	b:newLine()
	b:addLebel(2.2,1,'',28)
	b:addLebel(1,1,'血量≤',28)
	b:addComboBox(1.5,1,'好友邀请的超鬼王攻打血线','0','0','10','20','30','40','50','60','70','80','90','99','100')
	b:addLebel(2,1,'% 停止攻打',28)
	b:newLine()
	b:addLebel(2.2,1,'',28)
	b:addCheckBoxGroup(4,1,'超鬼王不打公开鬼王',nil,'不打公开鬼王')
	b:newLine()
	b:addLebel(9.5,1,'(自己发现的超鬼王若不满足攻打条件，会按“邀请好友”中的设置直接邀请出去。)',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'集火设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(8,1,'标记超鬼王','0@1','标记BOSS','标记草人')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addLebel(9.5,1,'(若要点草人，丑女请不要使用布偶皮肤)',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addCheckBoxGroup(2.5,1,'超鬼王是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'超鬼王标记己方','0','1号位','2号位','3号位','4号位','5号位')
	p:newLine()
	p:addLebel(1.5,1,'切换阵容',30,nil,'0,0,255')
	p:newLine()
	local b=p:newBox(0.5,4)
	b:addLebel(1.5,1,'  六星使用',28)
	b:addComboBox(1.6,1,'六星一队','0','阵容1','阵容2','阵容3','阵容4')
	b:addLebel(1.5,1,'，血量低于',28)
	b:addComboBox(1.5,1,'六星切换阵容血线','4','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(1.2,1,'% 时切换',28)
	b:addComboBox(1.6,1,'六星二队','1','阵容1','阵容2','阵容3','阵容4')
	b:newLine()
	b:addLebel(1.5,1,'  五星使用',28)
	b:addComboBox(1.6,1,'五星一队','0','阵容1','阵容2','阵容3','阵容4')
	b:addLebel(1.5,1,'，血量低于',28)
	b:addComboBox(1.5,1,'五星切换阵容血线','4','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(1.2,1,'% 时切换',28)
	b:addComboBox(1.6,1,'五星二队','1','阵容1','阵容2','阵容3','阵容4')
	b:newLine()
	b:addLebel(1.5,1,'  四星使用',28)
	b:addComboBox(1.6,1,'四星一队','0','阵容1','阵容2','阵容3','阵容4')
	b:addLebel(1.5,1,'，血量低于',28)
	b:addComboBox(1.5,1,'四星切换阵容血线','4','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(1.2,1,'% 时切换',28)
	b:addComboBox(1.6,1,'四星二队','1','阵容1','阵容2','阵容3','阵容4')
	b:newLine()
	b:addLebel(1.5,1,'  三星使用',28)
	b:addComboBox(1.6,1,'三星一队','0','阵容1','阵容2','阵容3','阵容4')
	b:addLebel(1.5,1,'，血量低于',28)
	b:addComboBox(1.5,1,'三星切换阵容血线','4','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(1.2,1,'% 时切换',28)
	b:addComboBox(1.6,1,'三星二队','1','阵容1','阵容2','阵容3','阵容4')
	b:newLine()
	b:addLebel(1.5,1,'  二星使用',28)
	b:addComboBox(1.6,1,'二星一队','0','阵容1','阵容2','阵容3','阵容4')
	b:addLebel(1.5,1,'，血量低于',28)
	b:addComboBox(1.5,1,'二星切换阵容血线','4','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(1.2,1,'% 时切换',28)
	b:addComboBox(1.6,1,'二星二队','1','阵容1','阵容2','阵容3','阵容4')
	b:newLine()
	b:addLebel(1.5,1,'  一星使用',28)
	b:addComboBox(1.6,1,'一星一队','0','阵容1','阵容2','阵容3','阵容4')
	b:addLebel(1.5,1,'，血量低于',28)
	b:addComboBox(1.5,1,'一星切换阵容血线','4','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(1.2,1,'% 时切换',28)
	b:addComboBox(1.6,1,'一星二队','1','阵容1','阵容2','阵容3','阵容4')
	b:newLine()
	p:newLine()
	p:addLebel(1.5,1,'强力追击',30,nil,'0,0,255')
	p:newLine()
	local b=p:newBox(0.5,4.5)
	b:addCheckBoxGroup(1.5,1,'六星超鬼王强力追击','0','六星')
	b:addComboBox(1.5,1,'六星超鬼王强力追击血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'六星超鬼王强力追击血量上限','100','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2,1,'% 时强力追击',28)
	b:newLine()
	b:addCheckBoxGroup(1.5,1,'五星超鬼王强力追击','0','五星')
	b:addComboBox(1.5,1,'五星超鬼王强力追击血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'五星超鬼王强力追击血量上限','100','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2,1,'% 时强力追击',28)
	b:newLine()
	b:addCheckBoxGroup(1.5,1,'四星超鬼王强力追击','0','四星')
	b:addComboBox(1.5,1,'四星超鬼王强力追击血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'四星超鬼王强力追击血量上限','100','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2,1,'% 时强力追击',28)
	b:newLine()
	b:addCheckBoxGroup(1.5,1,'三星超鬼王强力追击','0','三星')
	b:addComboBox(1.5,1,'三星超鬼王强力追击血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'三星超鬼王强力追击血量上限','100','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2,1,'% 时强力追击',28)
	b:newLine()
	b:addCheckBoxGroup(1.5,1,'二星超鬼王强力追击','0','二星')
	b:addComboBox(1.5,1,'二星超鬼王强力追击血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'二星超鬼王强力追击血量上限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2,1,'% 时强力追击',28)
	b:newLine()
	b:addCheckBoxGroup(1.5,1,'一星超鬼王强力追击','0','一星')
	b:addComboBox(1.5,1,'一星超鬼王强力追击血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'一星超鬼王强力追击血量上限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2,1,'% 时强力追击',28)
	p:newLine()
	p:addLebel(1.5,1,'邀请好友',30,nil,'0,0,255')
	p:newLine()
	local b=p:newBox(0.5,4)
	b:addCheckBoxGroup(2.1,1,'六星超鬼王邀请','0','六星邀请')
	b:addComboBox(1.5,1,'六星超鬼王邀请血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'六星超鬼王邀请血量上限','3','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(0.7,1,'% 时',28)
	b:addComboBox(2,1,'六星超鬼王邀请目标','1','邀请固定队友','邀请5个好友','邀请5个寮友','邀请第1个好友','邀请第1个寮友','公开')
	b:newLine()
	b:addCheckBoxGroup(2.1,1,'五星超鬼王邀请','0','五星邀请')
	b:addComboBox(1.5,1,'五星超鬼王邀请血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'五星超鬼王邀请血量上限','3','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(0.7,1,'% 时',28)
	b:addComboBox(2,1,'五星超鬼王邀请目标','1','邀请固定队友','邀请5个好友','邀请5个寮友','邀请第1个好友','邀请第1个寮友','公开')
	b:newLine()
	b:addCheckBoxGroup(2.1,1,'四星超鬼王邀请','0','四星邀请')
	b:addComboBox(1.5,1,'四星超鬼王邀请血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'四星超鬼王邀请血量上限','3','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(0.7,1,'% 时',28)
	b:addComboBox(2,1,'四星超鬼王邀请目标','1','邀请固定队友','邀请5个好友','邀请5个寮友','邀请第1个好友','邀请第1个寮友')
	b:newLine()
	b:addCheckBoxGroup(2.1,1,'三星超鬼王邀请','0','三星邀请')
	b:addComboBox(1.5,1,'三星超鬼王邀请血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'三星超鬼王邀请血量上限','3','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(0.7,1,'% 时',28)
	b:addComboBox(2,1,'三星超鬼王邀请目标','1','邀请固定队友','邀请5个好友','邀请5个寮友','邀请第1个好友','邀请第1个寮友')
	b:newLine()
	b:addCheckBoxGroup(2.1,1,'二星超鬼王邀请','0','二星邀请')
	b:addComboBox(1.5,1,'二星超鬼王邀请血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'二星超鬼王邀请血量上限','3','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(0.7,1,'% 时',28)
	b:addComboBox(2,1,'二星超鬼王邀请目标','1','邀请固定队友','邀请5个好友','邀请5个寮友','邀请第1个好友','邀请第1个寮友')
	b:newLine()
	b:addCheckBoxGroup(2.1,1,'一星超鬼王邀请','0','一星邀请')
	b:addComboBox(1.5,1,'一星超鬼王邀请血量下限','0','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(2.1,1,'%  ≤ 副本血量 ≤',28)
	b:addComboBox(1.5,1,'一星超鬼王邀请血量上限','3','0','10','20','30','40','50','60','70','80','90','100')
	b:addLebel(0.7,1,'% 时',28)
	b:addComboBox(2,1,'一星超鬼王邀请目标','1','邀请固定队友','邀请5个好友','邀请5个寮友','邀请第1个好友','邀请第1个寮友')
	p:newLine()
	p:addCheckBoxGroup(3,1,'超鬼王重设固定队友',nil,'重设固定队友')
	p:addLebel(2.3,1,'固定队友识别精度',30,nil,'0,0,255')
	p:addEdit(1.5,1,'超鬼王固定好友识别度','95')
	p:newLine()
	p:addLebel(10,2,'(初次使用“邀请固定队友”选项时请根据引导设置固定队友，再次启动脚本时默认邀请已保存的固定队友。固定队友尽量不要使用动态头像框，以免无法识别。若要重设固定队友，请勾选【重设固定队友】。)',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'震动提醒',30,nil,'0,0,255')
	p:addCheckBoxGroup(10,1,'超鬼王震动提醒','0@1@2','四星震动提醒','五星震动提醒','六星震动提醒')
	p:newLine()
	p:addLebel(1.5,1,'疲劳值满后',30,nil,'0,0,255')
	p:addRadioBoxGroup(8,2,'疲劳值满后','2','自动购买','直接返回主任务','等待疲劳值恢复','震动提醒')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addLebel(1.5,1,'疲劳恢复至',28)
	p:addComboBox(1.5,1,'超鬼王返回主任务疲劳值','5','0','10','20','30','40','50','60','70','80','90','100')
	p:addLebel(4,1,'后返回主任务',28)
	p:newLine()
	p:addLebel(1.5,1,'发现次数满',30,nil,'0,0,255')
	p:addCheckBoxGroup(7,1,'超鬼王发现次数满',nil,'发现50次后切换超鬼王为主任务')
	p:newLine()
	p:addLebel(9.5,1,'(切换超鬼王为主任务后，将不再执行当前主任务，仅等待接受超鬼王邀请)',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(1.5,1,'识别延时',30,nil,'0,0,255')
	p:addLebel(3,1,'识别超鬼王前延时',28)
	p:addComboBox(1.5,1,'识别超鬼王前延时','2','1','1.5','2','2.5','3','3.5','4','4.5','5')
	p:addLebel(4,1,'秒',28)
	p:newLine()
	p:addLebel(9.5,2,'(部分设备若出现主任务发现超鬼王后仍继续主任务的问题，可增大识别前延时，默认为延时2秒)',25,nil,'255,0,0')
	p:newLine()
	p:addLebel(2,1,'血线识别精度',30,nil,'0,0,255')
	p:addEdit(1.5,1,'超鬼王血线识别精度','62')
	p:addCheckBoxGroup(2,1,'超鬼王显示血线',nil,'显示血线')
	p:newLine()
	p:addLebel(9.5,3,'(部分设备若出现邀请、开关强力、切换阵容出错的问题，均由于血线识别错误导致，提高血线识别精度或可以解决，但过高的精度将反而导致无法识别，用户请自行调试。血线识别精度必须在50-100之间的整数，默认为62。)',25,nil,'255,0,0')
	p:newLine(2)
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	
	
	
	p=ui:newPage('死神')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"穿插死神",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'是否挤车',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,1,'死神挤车',nil,'挤车')
	p:newLine()
	p:addLebel(1.5,1,'金币Buff',30,nil,'0,0,255')
	p:addCheckBoxGroup(6,3.5,'交叉死神开金币buff',nil,'挤车时开启','自己发现时开启')
	p:newLine()

	p=ui:newPage('离岛之歌')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"离岛之歌",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'选择目标',30,nil,'0,0,255')
	p:addRadioBoxGroup(8,1,'离岛副本','1','经验','金币','觉醒','御魂')
	p:newLine()
	p:addLebel(1.5,1,'选择难度',30,nil,'0,0,255')
	p:addRadioBoxGroup(10,1,'离岛难度','2','简单','普通','困难')
	p:newLine()
	p:addLebel(1.5,1,'集火设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(1.5,1,'离岛点怪',nil,'点怪')
	p:addRadioBoxGroup(8,1,'离岛集火目标','0','小怪','大怪','大怪及草人')
	p:newLine()
	p:addLebel(1.5,1,'活力耗尽',30,nil,'0,0,255')
	p:addCheckBoxGroup(8,1,'离岛活力耗尽',nil,'泡澡','消耗勾玉')
	p:newLine()
	p:addLebel(1.5,1,'消耗条件',30,nil,'0,0,255')
	p:addCheckBoxGroup(8,1,'离岛CD时消耗勾玉',nil,'澡堂CD时消耗勾玉')
	p:newLine()
	p:addLebel(1.5,1,'选择汤浴',30,nil,'0,0,255')
	p:addRadioBoxGroup(8,1,'离岛汤浴','0','粗盐','薰草','露天')
	p:newLine()

	p=ui:newPage('修罗战场')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"修罗战场",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'选择目标',30,nil,'0,0,255')
	p:addRadioBoxGroup(8,1,'修罗战场_副本','0','兵俑','食发鬼','武士之灵','山兔')
	p:newLine()
	p:addLebel(1.5,1,'选择难度',30,nil,'0,0,255')
	p:addRadioBoxGroup(10,1,'修罗战场_难度','2','锻火','覆土','淬水')
	p:newLine()
	p:addLebel(1.5,1,'士气要求',30,nil,'0,0,255')
	p:addLebel(1.5,1,'士气低于',28)
	p:addComboBox(1.5,1,'修罗战场_士气下限','2','0','10','40')
	p:addLebel(1.5,1,'时等待',28)
	p:newLine()
	p:addLebel(1.5,1,'集火设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(1.5,1,'修罗战场_是否点怪',nil,'点怪')
	b=p:newBox(3.7,2)
	b:addLebel(1,1,'一回目',28)
	b:addComboBox(1.2,1,'修罗战场_点怪一回目','2','左','中','右')
	b:newLine()
	b:addLebel(1,1,'二回目',28)
	b:addComboBox(1.2,1,'修罗战场_点怪二回目','2','左','中','右')
	b:newLine()
	b:addLebel(1,1,'三回目',28)
	b:addComboBox(1.2,1,'修罗战场_点怪三回目','2','左','中','右')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addCheckBoxGroup(2.5,1,'修罗战场是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'修罗战场标记己方','0','1号位','2号位','3号位','4号位','5号位')
	p:newLine()
	
	p=ui:newPage('决战鬼王座')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"决战鬼王座",40,nil,'255,255,255')
	p:newLine()
	p:addLebel(1.5,1,'退出条件',30,nil,'0,0,255')
	p:addComboBox(3,1,'海国退治_退出条件','0','不退','伤害满五百万','伤害满一千万')
	p:newLine()
	p:addLebel(1.5,1,'集火设置',30,nil,'0,0,255')
	p:addCheckBoxGroup(1.5,1,'海国退治_点怪',nil,'点怪')
	p:addRadioBoxGroup(8,1,'海国退治_标记','3','小怪','Boss','草人','Boss及草人')
	p:newLine()
	p:addLebel(1.5,1,'',30,nil,'0,0,255')
	p:addCheckBoxGroup(2.5,1,'海国退治是否标记己方',nil,'标记己方')
	p:addComboBox(2,1,'海国退治标记己方','0','1号位','2号位','3号位','4号位','5号位')
	p:newLine()
	p:addLebel(9.5,3,'如需标记草人，丑女请勿使用布偶皮肤。\n小怪阶段建议勾选“Boss及草人”，本体阶段直接勾选“草人”识别更准。\n需要标记的己方请尽量放在1号位或5号位，不容易点错。',25,nil,'255,0,0')
	p:newLine()
	
--	p=ui:newPage('联系我')
--	p:newLine(0.5)
--	p:addLebel(9.5,2,'    作者是脚本业余爱好者，写脚本纯粹为了娱乐。有任何建议意见、或Bug反馈请加群536562759，我会改进！',25,nil,'255,0,0')
--	p:newLine()
	
	
	return ui
end

function 选择服务器()
	ui:new(参数.设备宽/2,参数.设备高/1.5,'启动脚本','退出脚本','hhd_yys_server')
	local p=ui:newPage('选择服务器')
	p:newLine()
	local b=p:newBox(0.5,5)
	b:addImage(3,1,'icons/titleicon.jpg')
	p:addLebel(3,2,"服务器",40,nil,'255,255,255')
	p:newLine()
	p:addRadioBoxGroup(10,1,'服务器','0','正式服','体验服')
	return ui
end
