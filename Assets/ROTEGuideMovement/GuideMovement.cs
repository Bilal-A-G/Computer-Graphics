using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GuideMovement : MonoBehaviour
{
    [SerializeField] private Transform followPoint;
    [SerializeField] private float followSpeed;
    [SerializeField] private float followRadius;

    private Rigidbody _rb;

    private void Awake()
    {
        _rb = GetComponent<Rigidbody>();
    }

    private void FixedUpdate()
    {
        Vector3 toPoint = followPoint.position - transform.position;
        float distance = toPoint.magnitude;
        if(distance < followRadius)
            return;

        Vector3 moveDirection = toPoint.normalized;
        
        _rb.AddForce(moveDirection * (distance * followSpeed * Time.fixedDeltaTime), ForceMode.Impulse);
    }
}
