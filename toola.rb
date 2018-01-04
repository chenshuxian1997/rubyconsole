require 'sketchup.rb'
#ruby console


 
 def cl				#控制台开启	如果true?hide：shouw
	SKETCHUP_CONSOLE.visible?	?	SKETCHUP_CONSOLE.hide	:	SKETCHUP_CONSOLE.show
	end

def clear				#控制台清理
		SKETCHUP_CONSOLE.clear 	if 		SKETCHUP_CONSOLE.visible?
	
end


def find_png(file_name="") #查找png图片，获取全路径名
	path=Sketchup.find_support_file file_name,"plugins/image"
	return path
end

#添加菜单
pmenu=UI.menu("Plugins") #"扩展程序"菜单栏
submenu=pmenu.add_submenu("Control") #添加子菜单
submenu.add_item("rubyconsole"){cl}
submenu.add_item("consoleclear"){clear}
#添加工具栏
toolbar = UI::Toolbar.new "Control"

cmd = UI::Command.new("Control"){cl}
cmd.small_icon =find_png "rubyconsole.png"
cmd.large_icon =find_png "rubyconsole.png"
cmd.tooltip = "rubyconsole"
cmd.status_bar_text = "rubyconsole"
cmd.menu_text = "rubyconsole"
toolbar = toolbar.add_item cmd
toolbar.show

cmd = UI::Command.new("Control"){clear}
cmd.small_icon =find_png "consoleclear.png"
cmd.large_icon =find_png "consoleclear.png"
cmd.tooltip = "consoleclear"
cmd.status_bar_text = "consoleclear"
cmd.menu_text = "consoleclear"
toolbar = toolbar.add_item cmd
toolbar.show