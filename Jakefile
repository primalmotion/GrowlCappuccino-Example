/*
 * Jakefile
 * GrowlCappuccino-Example
 *
 * Created by You on November 1, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("GrowlCappuccinoExample", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "GrowlCappuccinoExample.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("GrowlCappuccino-Example");
    task.setIdentifier("com.yourcompany.GrowlCappuccinoExample");
    task.setVersion("1.0");
    task.setAuthor("Your Company");
    task.setEmail("feedback @nospam@ yourcompany.com");
    task.setSummary("GrowlCappuccino-Example");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["GrowlCappuccinoExample"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "GrowlCappuccinoExample", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "GrowlCappuccinoExample", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "GrowlCappuccinoExample"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "GrowlCappuccinoExample"), FILE.join("Build", "Deployment", "GrowlCappuccinoExample")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "GrowlCappuccinoExample"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "GrowlCappuccinoExample"), FILE.join("Build", "Desktop", "GrowlCappuccinoExample", "GrowlCappuccinoExample.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "GrowlCappuccinoExample", "GrowlCappuccinoExample.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "GrowlCappuccinoExample"));
    print("----------------------------");
}
