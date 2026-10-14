<GameFile>
  <PropertyGroup Name="action_limit_gift_main_panel" Type="Layer" ID="l16fnek4ovgctwp20hx8ubar375sqid9jm-z" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="862.000000" />
        <Children>
          <AbstractNodeData Name="main_container" ActionTag="117466941" Tag="268" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="102" LeftEage="-237" RightEage="-237" TopEage="-299" BottomEage="-299" Scale9OriginX="-237" Scale9OriginY="-299" Scale9Width="474" Scale9Height="598" ctype="PanelObjectData">
            <Size Y="862" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="431" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="title_img" ActionTag="879465583" Tag="269" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="408" BottomMargin="408" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="431" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="level_img" ActionTag="-187166349" Tag="288" RotationSkewX="0" RotationSkewY="0" LeftMargin="87.127998" RightMargin="586.872009" TopMargin="193.275803" BottomMargin="622.724182" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="1" ScaleY="0.5" />
                <Position X="133.128006" Y="645.724182" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="time_val" ActionTag="2113988609" Tag="270" RotationSkewX="0" RotationSkewY="0" LeftMargin="23.626699" RightMargin="671.373291" TopMargin="510.606293" BottomMargin="320.393707" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="31" X="25" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="23.626699" Y="335.893707" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="90" G="214" R="8" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="value" ActionTag="-1449670224" Tag="289" RotationSkewX="0" RotationSkewY="0" LeftMargin="584.249817" RightMargin="110.750198" TopMargin="577.824585" BottomMargin="253.1754" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="31" X="25" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="596.749817" Y="268.675415" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="34" G="83" R="147" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="item_scrollview" ActionTag="2038488725" Tag="274" RotationSkewX="0" RotationSkewY="0" LeftMargin="37.875999" RightMargin="213.123993" TopMargin="569.549927" BottomMargin="172.450104" TouchEnable="True" BackColorAlpha="102" IsBounceEnabled="True" ScrollDirectionType="Vertical_Horizontal" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ClipAble="True" ctype="ScrollViewObjectData">
                <Size Y="120" X="469" />
                <AnchorPoint ScaleX="0.5" ScaleY="1" />
                <Position X="272.376007" Y="292.450104" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="100" G="150" R="255" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="100" G="150" R="255" />
                <InnerNodeSize Height="530" Width="570" />
              </AbstractNodeData>
              <AbstractNodeData Name="comfirm_btn" ActionTag="-900176747" Tag="275" RotationSkewX="0" RotationSkewY="0" LeftMargin="521.610107" RightMargin="33.282501" TopMargin="621.502014" BottomMargin="176.498001" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="20" BottomEage="20" Scale9OriginX="17" Scale9OriginY="20" Scale9Width="30" Scale9Height="23" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="64" X="165.107407" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="604.163818" Y="208.498001" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="-513072557" Tag="276" RotationSkewX="0" RotationSkewY="0" LeftMargin="66.553703" RightMargin="66.553703" TopMargin="13" BottomMargin="13" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="38" X="32" />
                    <AnchorPoint ScaleX="0.4633" ScaleY="0.4008" />
                    <Position X="81.379898" Y="28.2307" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="118" G="239" R="248" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="5" G="39" R="92" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
