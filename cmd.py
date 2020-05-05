import os
import sublime_plugin

class CmdCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        file_name = self.view.file_name()
        file_name_name = file_name.split("\\")[-1]
        os.chdir(sublime_plugin.sublime.packages_path() + '\\CMD')
        file_name_type = file_name.split('.')[-1]
        
        if file_name_type == 'py':
            os.system('start python_starter.bat \"' + file_name + '\"')

        elif file_name_type == 'cpp':
        	command = 'g++ ' + file_name_name + ' -o ' + file_name_name.split('.')[0]
        	os.system(command)
        	os.system('start ' + file_name_name.split('.')[0] + '.exe')
