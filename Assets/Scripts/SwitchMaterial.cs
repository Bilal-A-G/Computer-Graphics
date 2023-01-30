using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SwitchMaterial : MonoBehaviour
{
    [SerializeField] private Material[] materials;
    [SerializeField] private MeshRenderer renderer;

    private void Start()
    {
        if (materials.Length is < 6 or > 6)
        {
            Debug.LogError("Error, the materials array must contain 6 elements");
        }
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            renderer.material = materials[0];
        }
        else if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            renderer.material = materials[1];
        }
        else if(Input.GetKeyDown(KeyCode.Alpha3))
        {
            renderer.material = materials[2];
        }
        else if (Input.GetKeyDown(KeyCode.Alpha4))
        {
            renderer.material = materials[3];
        }
        else if (Input.GetKeyDown(KeyCode.Alpha5))
        {
            renderer.material = materials[4];
        }
        else if (Input.GetKeyDown(KeyCode.Alpha6))
        {
            renderer.material = materials[5];
        }
    }
}
