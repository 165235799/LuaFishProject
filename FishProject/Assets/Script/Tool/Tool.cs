using LuaInterface;
using UnityEngine;
using UnityEngine.UI;

public class Tool
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
        if(obj != null)
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
}
