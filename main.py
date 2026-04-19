class Plugin:
    def __init__(self, name):
        self.name = name

class PluginManager:
    def __init__(self):
        self.plugins = []

    def add_plugin(self, plugin):
        self.plugins.append(plugin)

    def remove_plugin(self, plugin):
        self.plugins.remove(plugin)

    def list_plugins(self):
        for plugin in self.plugins:
            print(plugin.name)

class PluginA(Plugin):
    def __init__(self):
        super().__init__("Plugin A")

    def run(self):
        print("Plugin A is running")

class PluginB(Plugin):
    def __init__(self):
        super().__init__("Plugin B")

    def run(self):
        print("Plugin B is running")

def main():
    manager = PluginManager()
    plugin_a = PluginA()
    plugin_b = PluginB()
    manager.add_plugin(plugin_a)
    manager.add_plugin(plugin_b)
    manager.list_plugins()
    plugin_a.run()
    plugin_b.run()
    manager.remove_plugin(plugin_a)
    manager.list_plugins()

if __name__ == "__main__":
    main()

class PluginC(Plugin):
    def __init__(self):
        super().__init__("Plugin C")

    def run(self):
        print("Plugin C is running")

class PluginD(Plugin):
    def __init__(self):
        super().__init__("Plugin D")

    def run(self):
        print("Plugin D is running")

def main2():
    manager = PluginManager()
    plugin_c = PluginC()
    plugin_d = PluginD()
    manager.add_plugin(plugin_c)
    manager.add_plugin(plugin_d)
    manager.list_plugins()
    plugin_c.run()
    plugin_d.run()

if __name__ == "__main__":
    main()
    main2()