Shader "Custom/ToonShader"
{
    Properties
    {
        _Colour ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _ToonRamp ("Toon Ramp (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf ToonRamp

        sampler2D _MainTex;
        sampler2D _ToonRamp;
        float3 _Colour;

        float4 LightingToonRamp(SurfaceOutput s, fixed3 lightDir, fixed attenuation)
        {
            float diffuseStrength = dot(s.Normal, normalize(lightDir));
            diffuseStrength *= 0.5 + 0.5;
            float3 colour = tex2D(_ToonRamp, float2(diffuseStrength, 0)) * _Colour;
            return float4(colour.rgb, 0);
        }

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o){}
        ENDCG
    }
    FallBack "Diffuse"
}
