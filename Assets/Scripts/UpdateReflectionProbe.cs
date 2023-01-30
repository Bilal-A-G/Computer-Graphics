using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpdateReflectionProbe : MonoBehaviour
{
    [SerializeField] private ReflectionProbe probe;
    [SerializeField] private RenderTexture reflectionMap;

    void Update()
    {
        probe.RenderProbe(reflectionMap);
    }
}
