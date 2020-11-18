﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LuaSceneTool
{
    public static int CurrentSceneIndex = -1;
    public static int SceneIndex = -1;
    public static bool IsUnload = false;

    /// <summary>
    /// 切换场景
    /// </summary>
    /// <param name="sceneIndex">目标场景ID</param>
    /// <param name="isUnload">是否卸载上一个场景</param>
    public static void ChangeScene(int sceneIndex, bool isUnload)
    {
        SceneIndex = sceneIndex;
        IsUnload = isUnload;

        SceneManager.LoadScene(1, LoadSceneMode.Additive);
    }

    public static void ClearSceneData()
    {
        CurrentSceneIndex = -1;
        SceneIndex = -1;
        IsUnload = false;
    }
}