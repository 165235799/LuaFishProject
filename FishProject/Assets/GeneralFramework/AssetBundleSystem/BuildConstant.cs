using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BuildConstant
{
    public const int WINDOW_WIDTH = 800;
    public const int WINDOW_HEIGHT = 800;

    public const int PACK_AREAN_WIDTH = 780;
    public const int PACK_AREAN_HEIGHT = 650;

    public const string ASSET_BUNDLE_VARIANT = "unity3d";

    public enum PlatformType
    {
        Android = 0,
        IOS = 1,
    }

    public static string GetLuaCopyPath(string folderName)
    {
        return string.Format(Application.dataPath + "/{0}/", folderName);
    }

    public static string GetLuaTempPath()
    {
        return Application.dataPath + "/LuaTemp/";
    }

    public static string GetLuaPath()
    {
        return Application.dataPath + "/Lua/";
    }

    public static string GetSavePathPath()
    {
        return "Assets/GeneralFramework/AssetBundleSystem/SavePackPath.asset";
    }
}
