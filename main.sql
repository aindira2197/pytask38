CREATE TABLE Plugins (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  version VARCHAR(20) NOT NULL,
  author VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE PluginTypes (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

CREATE TABLE PluginInstances (
  id INT PRIMARY KEY,
  plugin_id INT NOT NULL,
  type_id INT NOT NULL,
  config TEXT,
  FOREIGN KEY (plugin_id) REFERENCES Plugins(id),
  FOREIGN KEY (type_id) REFERENCES PluginTypes(id)
);

CREATE TABLE PluginHooks (
  id INT PRIMARY KEY,
  plugin_id INT NOT NULL,
  hook_name VARCHAR(100) NOT NULL,
  hook_description TEXT,
  FOREIGN KEY (plugin_id) REFERENCES Plugins(id)
);

CREATE TABLE PluginHookInstances (
  id INT PRIMARY KEY,
  plugin_hook_id INT NOT NULL,
  instance_id INT NOT NULL,
  FOREIGN KEY (plugin_hook_id) REFERENCES PluginHooks(id),
  FOREIGN KEY (instance_id) REFERENCES PluginInstances(id)
);

CREATE TABLE PluginSettings (
  id INT PRIMARY KEY,
  plugin_id INT NOT NULL,
  setting_name VARCHAR(100) NOT NULL,
  setting_value TEXT,
  FOREIGN KEY (plugin_id) REFERENCES Plugins(id)
);

CREATE TABLE PluginDependencies (
  id INT PRIMARY KEY,
  plugin_id INT NOT NULL,
  dependency_id INT NOT NULL,
  FOREIGN KEY (plugin_id) REFERENCES Plugins(id),
  FOREIGN KEY (dependency_id) REFERENCES Plugins(id)
);

CREATE TABLE PluginUpdates (
  id INT PRIMARY KEY,
  plugin_id INT NOT NULL,
  version VARCHAR(20) NOT NULL,
  update_description TEXT,
  FOREIGN KEY (plugin_id) REFERENCES Plugins(id)
);

CREATE INDEX idx_plugins_name ON Plugins (name);
CREATE INDEX idx_plugininstances_plugin_id ON PluginInstances (plugin_id);
CREATE INDEX idx_pluginhooks_plugin_id ON PluginHooks (plugin_id);
CREATE INDEX idx_pluginhookinstances_plugin_hook_id ON PluginHookInstances (plugin_hook_id);
CREATE INDEX idx_plugindependencies_plugin_id ON PluginDependencies (plugin_id);
CREATE INDEX idx_pluginupdates_plugin_id ON PluginUpdates (plugin_id);

INSERT INTO PluginTypes (id, name, description) VALUES
(1, 'Payment Gateway', 'Payment gateway plugins'),
(2, ' Shipping Provider', 'Shipping provider plugins'),
(3, 'Social Media', 'Social media plugins');

INSERT INTO Plugins (id, name, description, version, author) VALUES
(1, 'PayPal', 'PayPal payment gateway', '1.0', 'PayPal Inc'),
(2, 'Stripe', 'Stripe payment gateway', '1.0', 'Stripe Inc'),
(3, 'Facebook', 'Facebook social media plugin', '1.0', 'Facebook Inc');

INSERT INTO PluginInstances (id, plugin_id, type_id, config) VALUES
(1, 1, 1, '{"api_key": "abc123", "api_secret": "def456"}'),
(2, 2, 1, '{"api_key": "ghi789", "api_secret": "jkl012"}'),
(3, 3, 3, '{"app_id": "mno345", "app_secret": "pqr678"}');

INSERT INTO PluginHooks (id, plugin_id, hook_name, hook_description) VALUES
(1, 1, 'payment_processing', 'Payment processing hook'),
(2, 2, 'payment_processing', 'Payment processing hook'),
(3, 3, 'social_media_share', 'Social media share hook');

INSERT INTO PluginHookInstances (id, plugin_hook_id, instance_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);