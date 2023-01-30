using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotate : MonoBehaviour
{
    [SerializeField] private Transform dynamicObject;
    [SerializeField] private Transform rotationPoint;
    [SerializeField] private float rotationSpeed;

    void Update()
    {
        dynamicObject.RotateAround(rotationPoint.position, Vector3.up, rotationSpeed * Time.deltaTime);
    }
}
