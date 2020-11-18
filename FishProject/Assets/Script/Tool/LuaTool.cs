using LuaInterface;
using SWS;
using UnityEngine;
using UnityEngine.UI;

public class LuaTool
{


    /// <summary>
    /// 实例化预制体
    /// </summary>
    /// <param name="prefabObj">预制体</param>
    /// <param name="parentObj">父节点</param>
    /// <param name="func">完成回调</param>
    public static void InstanceObj(GameObject prefabObj, Transform parentObj, LuaFunction func)
    {
        GameObject obj = GameObject.Instantiate(prefabObj, Vector3.one, Quaternion.identity, parentObj);
        if (obj != null)
        {
            obj.transform.localScale = Vector3.one;
            obj.transform.localPosition = Vector3.one;
            func.BeginPCall();
            func.Push(obj);
            func.PCall();
            func.EndPCall();
        }
    }

    /// <summary>
    /// 打印日志
    /// </summary>
    /// <param name="logType">日志类型(普通/警告/错误)</param>
    /// <param name="logStr">日志内容</param>
    public static void DebugLog(int logType, string logStr)
    {
        switch (logType)
        {
            case (int)LogType.Normal:
                Debug.Log(logStr);
                break;
            case (int)LogType.Warning:
                Debug.LogWarning(logStr);
                break;
            case (int)LogType.Error:
                Debug.LogError(logStr);
                break;
        }
    }

    /// <summary>
    /// 调试划线
    /// </summary>
    /// <param name="startPos"></param>
    /// <param name="dir"></param>
    public static void DebugDrawLine(Vector3 startPos, Vector3 dir)
    {
        Debug.DrawRay(startPos, dir, Color.red, 100);
    }

    /// <summary>
    /// 添加点击事件
    /// </summary>
    /// <param name="obj">目标控件</param>
    /// <param name="fun">回调函数</param>
    public static void OnClick(Transform obj, LuaFunction fun)
    {
        OnClick(obj.gameObject, fun);
    }

    /// <summary>
    /// 添加点击事件
    /// </summary>
    /// <param name="obj">目标控件</param>
    /// <param name="fun">回调函数</param>
    public static void OnClick(GameObject obj, LuaFunction fun)
    {
        if (obj.GetComponent<Button>())
        {
            Button btn = obj.GetComponent<Button>();
            btn.onClick.AddListener(fun.Call);
        }
        else
        {
            if (obj.GetComponent<ClickListener>() == null)
                obj.AddComponent<ClickListener>();

            ClickListener click = obj.GetComponent<ClickListener>();
            click.AddClickListener(() =>
            {
                fun.Call();
            });
        }
    }

    public static void AddListener(Transform trans, LuaFunction clickFunc, LuaFunction downFunc, LuaFunction upFunc)
    {
        AddListener(trans.gameObject, clickFunc, downFunc, upFunc);
    }

    public static void AddListener(GameObject obj, LuaFunction clickFunc, LuaFunction downFunc, LuaFunction upFunc)
    {
        if (obj.GetComponent<ClickListener>() == null)
            obj.AddComponent<ClickListener>();

        ClickListener click = obj.GetComponent<ClickListener>();
        click.AddClickListener(() =>
        {
            clickFunc.Call();
        });


        click.AddListener(() =>
        {
            downFunc.Call();
        },
        () =>
        {
            upFunc.Call();
        });
    }

    public static void SetGameObjectActive(GameObject obj, bool isShow)
    {
        obj.SetActive(isShow);
    }

    public static void SetGameObjectActive(Transform trans, bool isShow)
    {
        SetGameObjectActive(trans.gameObject, isShow);
    }

    /// <summary>
    /// 屏幕坐标转成本地坐标
    /// </summary>
    /// <param name="trans">转换父节点</param>
    /// <param name="screenPos">屏幕坐标</param>
    /// <returns></returns>
    public static Vector2 ScreenVectorToLocalVector(Transform trans, Vector3 screenPos)
    {
        Vector2 pos = Vector2.zero;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(trans as RectTransform,
            screenPos,
            GameObject.Find("UICamera").GetComponent<Camera>(),
            out pos);

        return pos;
    }

    /// <summary>
    /// 世界坐标转屏幕坐标
    /// </summary>
    /// <param name="renderCamera">渲染摄像机</param>
    /// <param name="worldPos">世界坐标</param>
    /// <returns></returns>
    public static Vector3 WorldToScenePos(Camera renderCamera, Vector3 worldPos)
    {
        return RectTransformUtility.WorldToScreenPoint(renderCamera, worldPos);
    }

    /// <summary>
    /// 获取子弹移动方向
    /// </summary>
    /// <param name="bulletPos"></param>
    /// <returns></returns>
    public static Vector2 GetBulletMoveDir(Vector3 bulletPos)
    {
        float minX = -(Screen.width / 2.0f);
        float maxX = (Screen.width / 2.0f);

        float minY = -(Screen.height / 2.0f);
        float maxY = (Screen.height / 2.0f);

        float x = 1;
        float y = 1;
        if (bulletPos.x <= minX || bulletPos.x >= maxX)
            x = -1;

        if (bulletPos.y <= minY || bulletPos.y >= maxY)
            y = -1;

        return new Vector2(x, y);
    }

    public static LuaTable GetFishLuaTable(GameObject obj)
    {
        return GetFishLuaTable(obj.transform);
    }

    public static LuaTable GetFishLuaTable(Transform obj)
    {
        LuaComponent lua = obj.parent.GetComponent<LuaComponent>();
        if(lua != null)
        {
            return lua.Lua;
        }
        else
        {
            return null;
        }
    }

    public static void FishDeath(GameObject obj)
    {
        FishDeath(obj.transform);
    }

    public static void FishDeath(Transform obj)
    {
        LuaComponent luaC = obj.GetComponent<LuaComponent>();
        if(luaC != null)
        {
            GameObject.DestroyImmediate(obj);
        }
    }
}
