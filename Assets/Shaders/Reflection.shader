Shader "Custom/Lab"
{
    Properties
    {
        _Colour ("Colour", Color) = (1,1,1,1)
        _ReflectionMap("Reflection Map", CUBE) = "white"{}
        _Intensity("Intensity", Range(0, 1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        
        struct Input
        {
            float2 uv_MainTex;
            float3 worldRefl;
        };
        
        fixed4 _Colour;
        samplerCUBE _ReflectionMap;
        float _Intensity;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = _Colour;
            o.Albedo = c.rgb * _Intensity;
            o.Emission = texCUBE(_ReflectionMap, IN.worldRefl).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
