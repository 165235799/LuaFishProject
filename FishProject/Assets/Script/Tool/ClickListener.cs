using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class ClickListener : MonoBehaviour,
    IPointerDownHandler, 
    IPointerUpHandler, 
    IPointerClickHandler
{
    private Action mClickEvent = null;
    private Action mDownEvent = null;
    private Action mUpEvent = null;

    public void AddClickListener(Action clickEvent)
    {
        mClickEvent = clickEvent;
    }

    public void AddListener(Action downEvent, Action upEvent)
    {
        mDownEvent = downEvent;
        mUpEvent = upEvent;
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (mClickEvent != null)
            mClickEvent();
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        if(mDownEvent != null)
        {
            mDownEvent();
        }
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        if (mUpEvent != null)
        {
            mUpEvent();
        }
    }
}
