Shader "Custom/Lab"
{
    Properties
    {
        _Colour ("Colour", Color) = (1,1,1,1)
        _ReflectionMap("Reflection Map", CUBE) = "white"{}
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
        };
        
        fixed4 _Colour;
        samplerCUBE _ReflectionMap;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = _Colour;
            o.Albedo = c.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
